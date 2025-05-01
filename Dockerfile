FROM ghcr.io/msd-live/jupyter/python-notebook:latest

USER root
RUN pip install --no-cache-dir git+https://github.com/JGCRI/demeter.git

USER jovyan
