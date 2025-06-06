FROM ghcr.io/msd-live/jupyter/python-notebook:latest

# Switch to root to install system packages or additional Python libraries
USER root

# Install required Python packages
RUN pip install --no-cache-dir pandas numpy matplotlib seaborn

# Install the Demeter package from GitHub
RUN pip install git+https://github.com/JGCRI/demeter.git

RUN pip install numpy==1.26.4

# Copy notebook and example into the container
COPY notebooks /home/jovyan/notebooks

# Switch back to the regular user
# DO NOT switch to jovyan user or else the notebook won't be able to start as the correct user
# USER jovyan
