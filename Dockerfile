FROM jupyter/scipy-notebook

USER root
RUN apt-get update && apt-get install -y \
    build-essential \
    xvfb \
    libcairo2-dev \
    curl \
    pkg-config \
    python3-dev \
    git && \
    rm -rf /var/lib/apt/lists/*

RUN pip install --upgrade pip setuptools wheel && \
    pip install jupyterlab cartopy xarray pooch

EXPOSE 8888

COPY geospatial_data_viz.ipynb /home/jovyan/

CMD ["xvfb-run", "jupyter", "lab", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--no-browser", "--NotebookApp.token=''"]
