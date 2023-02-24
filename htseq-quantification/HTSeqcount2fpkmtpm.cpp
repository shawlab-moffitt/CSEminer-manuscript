/************
 *
Author: Liqing Tian   12/1/2019
Contact: tianlq@gmail.com
 *
./HTSeqcount2fpkmtpm GTEx_7526_countfile.list 76 GTEx_7526_trans
 *
 */

#include <iostream>
#include <fstream>
#include <string>
#include <vector>
#include <map>
#include <algorithm>
#include <iomanip>
#include <sstream>

using namespace std;

struct exoninfor
{
	string rawexonname,type,chr,start,end,strand;
	int exon_length;
};

vector<string> split(const string &str, char delimiter)
{
	vector<string> internal;
	stringstream ss(str); // Turn the string into a stream.
	string tok;

	while(getline(ss, tok, delimiter))
	{
		internal.push_back(tok);
	}

	return internal;
}

int main(int argc,char *argv[])
{
	int i,j,k,ia,ib,ibuf;
	string sbuf,stemp;
	double dbuf;

	const int PRECISION=4;
	const int ReadLength=atoi(argv[2]);
	const string PREFIX(argv[3]);

	//read count file list
	vector<string> countfilelist,samplelist;

	ifstream is1(argv[1]);
	if(!is1) {cout<<"error1 "<<argv[1]<<endl;exit(0);}
	do
	{
		sbuf.clear();
		is1>>sbuf;
		if(sbuf.empty()) break;

		countfilelist.push_back(sbuf);
		ia=sbuf.rfind("/");
		ib=sbuf.rfind("_count.txt");
		stemp=sbuf.substr(ia+1,ib-ia-1);//cout<<stemp<<endl;exit(0);
		samplelist.push_back(stemp);//cout<<sbuf<<"\t"<<stemp<<endl;

	}while(!is1.eof());
	is1.close();

	//read one countfile; get exon name list
	vector<string> exonnamelist;

	ifstream is0(countfilelist[0].c_str());
	if(!is0) {cout<<"error0 "<<countfilelist[0]<<endl;exit(0);}
	do
	{
		sbuf.clear();
		is0>>sbuf;
		if(sbuf.empty()) break;
		if(sbuf=="__no_feature") break;

		exonnamelist.push_back(sbuf);
		is0>>dbuf;

	}while(!is0.eof());
	is0.close();

	//read exon infor
	map<string,exoninfor> exonname2infor;

	ifstream is2("gencode.v31.primary_assembly.exon.novelexon.txt");
	if(!is2) {cout<<"error2 "<<endl;exit(0);}
	do
	{
		sbuf.clear();
		getline(is2,sbuf);
		if(sbuf.empty()) break;

		vector<string> vstemp;
		vstemp=split(sbuf,'\t');

		exoninfor myexoninfor;
		stemp=vstemp[0];//cout<<sbuf<<endl;
		myexoninfor.rawexonname=vstemp[2];
		myexoninfor.type=vstemp[3];
		myexoninfor.chr=vstemp[4];
		myexoninfor.start=vstemp[5];
		myexoninfor.end=vstemp[6];
		myexoninfor.strand=vstemp[7];
		myexoninfor.exon_length=atoi(vstemp[8].c_str());

		exonname2infor[stemp]=myexoninfor;

	}while(!is2.eof());
	is2.close();

	if(exonnamelist.size()!=exonname2infor.size()) {cout<<"ERROR "<<exonnamelist.size()<<" "<<exonname2infor.size()<<endl;exit(0);}

	//
	string summaryfile=PREFIX+"-summary.txt";
	ofstream os0(summaryfile.c_str());
	os0<<"Sample\tMapped\tno_feature\tambiguous\ttoo_low_aQual\tnot_aligned\talignment_not_unique"<<endl;

	//
	string fpkmfile=PREFIX+"_FPKM.txt";
	ofstream os1(fpkmfile.c_str());
	os1<<"ExonID";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonnamelist[i];os1<<endl;

	os1<<"ExonName";
	for(i=0;i<exonnamelist.size();i++)
	{
		if(exonname2infor.find(exonnamelist[i])==exonname2infor.end()) {cout<<"ERROR1"<<endl;exit(0);}
		os1<<"\t"<<exonname2infor[exonnamelist[i]].rawexonname;
	}
	os1<<endl;

	os1<<"Type";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].type;os1<<endl;
	os1<<"Chr";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].chr;os1<<endl;
	os1<<"Start";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].start;os1<<endl;
	os1<<"End";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].end;os1<<endl;
	os1<<"Strand";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].strand;os1<<endl;
	os1<<"ExonLength";for(i=0;i<exonnamelist.size();i++) os1<<"\t"<<exonname2infor[exonnamelist[i]].exon_length;os1<<endl;

	//
	string tpmfile=PREFIX+"_TPM.txt";
	ofstream os2(tpmfile.c_str());
	os2<<"ExonID";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonnamelist[i];os2<<endl;

	os2<<"ExonName";
	for(i=0;i<exonnamelist.size();i++)
	{
		if(exonname2infor.find(exonnamelist[i])==exonname2infor.end()) {cout<<"ERROR1"<<endl;exit(0);}
		os2<<"\t"<<exonname2infor[exonnamelist[i]].rawexonname;
	}
	os2<<endl;

	os2<<"Type";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].type;os2<<endl;
	os2<<"Chr";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].chr;os2<<endl;
	os2<<"Start";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].start;os2<<endl;
	os2<<"End";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].end;os2<<endl;
	os2<<"Strand";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].strand;os2<<endl;
	os2<<"ExonLength";for(i=0;i<exonnamelist.size();i++) os2<<"\t"<<exonname2infor[exonnamelist[i]].exon_length;os2<<endl;

	for(i=0;i<samplelist.size();i++)
	{
		os1<<samplelist[i];
		os2<<samplelist[i];

		vector<string> vstemp;
		vector<double> vdtemp;
		double dtotal=0;

		ifstream is(countfilelist[i].c_str());
		if(!is) {cout<<"error3 "<<countfilelist[i]<<endl;exit(0);}
		for(j=0;j<exonnamelist.size();j++)
		{
			sbuf.clear();
			is>>sbuf;
			if(sbuf.empty()) break;

			vstemp.push_back(sbuf);

			is>>dbuf;
			dtotal+=dbuf;
			vdtemp.push_back(dbuf);
		}
		os0<<samplelist[i]<<"\t"<<(long int)dtotal;
		is>>sbuf>>ibuf;if(sbuf!="__no_feature") {cout<<"error4 "<<sbuf<<endl;exit(0);}
		os0<<"\t"<<ibuf;
		is>>sbuf>>ibuf;if(sbuf!="__ambiguous") {cout<<"error4 "<<sbuf<<endl;exit(0);}
		os0<<"\t"<<ibuf;
		is>>sbuf>>ibuf;if(sbuf!="__too_low_aQual") {cout<<"error4 "<<sbuf<<endl;exit(0);}
		os0<<"\t"<<ibuf;
		is>>sbuf>>ibuf;if(sbuf!="__not_aligned") {cout<<"error4 "<<sbuf<<endl;exit(0);}
		os0<<"\t"<<ibuf;
		is>>sbuf>>ibuf;if(sbuf!="__alignment_not_unique") {cout<<"error4 "<<sbuf<<endl;exit(0);}
		os0<<"\t"<<ibuf<<endl;

		//
		double fpkmtmp;
		vector<double> fpkmset;
		double dtotalfpkm=0;
		for(j=0;j<vdtemp.size();j++)
		{
			if(exonname2infor[exonnamelist[j]].exon_length>=ReadLength) fpkmtmp=1000000000*vdtemp[j]/(exonname2infor[exonnamelist[j]].exon_length*dtotal);
			else fpkmtmp=1000000000*vdtemp[j]/(ReadLength*dtotal);
			os1<<"\t"<<setprecision(PRECISION)<<fpkmtmp;
			fpkmset.push_back(fpkmtmp);
			dtotalfpkm+=fpkmtmp;
		}
		os1<<endl;

		double tpmtmp;
		for(j=0;j<fpkmset.size();j++)
		{
			tpmtmp=1000000*fpkmset[j]/dtotalfpkm;
			os2<<"\t"<<setprecision(PRECISION)<<tpmtmp;
		}
		os2<<endl;
	}
}
