FROM ghcr.io/msd-live/jupyter/datascience-notebook:latest

# Switch to root to install system packages or additional Python libraries
USER root

# Install required Python packages
RUN pip install --no-cache-dir pandas numpy matplotlib seaborn

# Install the Demeter package from GitHub
RUN pip install git+https://github.com/JGCRI/demeter.git

# Above command causes the following error - we need the right version of requests
# ERROR: pip's dependency resolver does not currently take into account all the packages that are installed. This behaviour is the source of the following dependency conflicts.
# jupyter-server 2.13.0 requires terminado>=0.8.3, which is not installed.
# conda 24.1.2 requires requests<3,>=2.28.0, but you have requests 2.20.1 which is incompatible.
# pygithub 2.8.1 requires urllib3>=1.26.0, but you have urllib3 1.24.3 which is incompatible.
# jupyterlab-server 2.25.4 requires requests>=2.31, but you have requests 2.20.1 which is incompatible.
# anyio 4.3.0 requires idna>=2.8, but you have idna 2.7 which is incompatible.
# Successfully installed cftime-1.6.5 chardet-3.0.4 click-default-group-1.2.4 
# click-default-group-wheel-1.2.3 configobj-5.0.9 
# demeter-2.0.1 gcamreader-1.4.0 idna-2.7 lxml-6.0.2 netcdf4-1.7.4 packaging-26.0 requests-2.20.1 urllib3-1.24.3 xarray-2026.2.0

# Switch back to the regular user
# USER jovyan cannot switch to jovyan, will break things in aws

RUN pip install "numpy==1.26.4" 
RUN pip install --ignore-installed --no-deps "requests>=2.31" "urllib3>=1.26.0" "idna>=2.8"

# Copy notebook and example into the container
COPY notebooks /home/jovyan/notebooks

# Switch back to the regular user
# DO NOT switch to jovyan user or else the notebook won't be able to start as the correct user
# USER jovyan
