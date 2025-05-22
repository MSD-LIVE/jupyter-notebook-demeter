FROM ghcr.io/msd-live/jupyter/python-notebook:latest
COPY notebooks /home/jovyan/notebooks
COPY example /home/jovyan/example
