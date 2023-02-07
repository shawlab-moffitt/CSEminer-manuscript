
curl --output DRPPM_20220511A_newmachine.jar -kL https://github.com/gatechatl/DRPPM/raw/master/export/DRPPM_20220511A_newmachine.jar
path2jar=`pwd`
echo "#!/bin/bash\njava -Xmx64g -XX:-UseGCOverheadLimit -jar "$path2jar"/DRPPM_20220511A_newmachine.jar $@" > drppm
chmod a+x drppm

if test -f "/usr/local/bin/drppm"; then
    echo "drppm already exist in /usr/local/bin/drppm"
else
    cp drppm /usr/local/bin/drppm
fi

#/usr/local/bin/
