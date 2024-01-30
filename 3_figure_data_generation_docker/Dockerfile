# Use an official OpenJDK runtime as a parent image
FROM openjdk:8-jre-alpine
# Set the working directory to /app
WORKDIR /app
# Copy the JAR file into the container at /app
COPY DockerInputs/DRPPM_20240112A_newmachine.jar /app/
# Copy other necessary files
COPY DockerInputs/drppm /app/
COPY DockerInputs/step1_unpack_zipped_files.sh /app/
COPY DockerInputs/step2_run_code_v2.sh /app/
COPY DockerInputs/pipeline_input_files.zip /app/
# Run the shell script commands
RUN chmod +x step1_unpack_zipped_files.sh && ./step1_unpack_zipped_files.sh
# Command to run your application
#CMD ["java", "-Xmx64g", "-XX:-UseGCOverheadLimit", "-jar", "DRPPM_20240112A_newmachine.jar", "-CSEminerFigure1ExonClassificationFullPipelineExecMode", "CompleteAnnotationPipeline/", "OutputFolder"]
CMD ["sh", "-c", "java -Xmx64g -XX:-UseGCOverheadLimit -jar DRPPM_20240112A_newmachine.jar -CSEminerFigure1ExonClassificationFullPipelineExecMode CompleteAnnotationPipeline/ OutputFolder"]


