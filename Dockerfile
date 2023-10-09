# Use the Jupyter/TensorFlow image as a parent image
FROM public.ecr.aws/kubeflow-on-aws/notebook-servers/jupyter-tensorflow:2.12.0-cpu-py310-ubuntu20.04-ec2-v1.0 as builder

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies
USER root
RUN apt-get update && apt-get install -y build-essential

# Clean up apt caches to reduce image size 
RUN rm -rf /var/lib/apt/lists/*
USER jovyan

# Set container working directory
WORKDIR /home/jovyan

# Copy training data and training script
COPY training.csv /home/jovyan/training.csv
COPY training.py /home/jovyan/training.py
COPY Model-demo.ipynb /home/jovyan/Model-demo.ipynb

# Second stage: runner
FROM public.ecr.aws/kubeflow-on-aws/notebook-servers/jupyter-tensorflow:2.12.0-cpu-py310-ubuntu20.04-ec2-v1.0 as runner

# Set environment variables to non-interactive (this prevents some prompts)
ENV DEBIAN_FRONTEND=noninteractive

# Set container working directory
WORKDIR /home/jovyan

# Install additional Python packages
COPY requirements.txt /
RUN pip install --no-cache-dir -r /requirements.txt 

# Copy the scripts from the builder stage
COPY --from=builder /home/jovyan /home/jovyan

# Expose the Jupyter Notebook port
EXPOSE 8888

# Specify the start command
CMD ["jupyter", "lab", "--ip=0.0.0.0", "--no-browser", "--allow-root"]
