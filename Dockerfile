FROM ghcr.io/msd-live/jupyter/python-notebook:latest

# Switch to root to install system packages or additional Python libraries
USER root

# Install required Python packages
RUN pip install --no-cache-dir pandas numpy matplotlib seaborn

# Install the Demeter package from GitHub
RUN pip install git+https://github.com/JGCRI/demeter.git

# Switch back to the regular user
USER jovyan

# Copy notebook into the container
COPY Demeter_2024_GCAM_annual_meeting.ipynb /home/jovyan/


