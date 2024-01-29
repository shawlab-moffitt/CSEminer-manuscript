echo 'Building the summary example'
docker build . -t cseminer_example

echo 'running the summary exampe'
docker run cseminer_example

echo ''
echo ''
echo '# user will need to fill container id based on the container id listed locally on the user's machine
echo 'docker ps -l'
docker ps -l
echo 'docker cp [container id]:/app/OutputFolder/ . '
echo ''
echo '# to build the docker'
echo 'docker save -o CSEminer_3_figure_data_generation.tar cseminer_example'
