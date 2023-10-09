## Jupyter-XGBoost Predictor Application

This application offers a streamlined Jupyter Notebook environment that's optimized for containerization. Although based on a TensorFlow 2.12.0 image with Python 3.10 support, the notebook primarily employs XGBoost for model training. It provides a comprehensive data science pipeline, featuring data manipulation with pandas and machine learning via XGBoost. Fully containerized, this Jupyter-XGBoost notebook ensures effortless deployments using Docker.

## About
📦 This app is purpose-built for container deployment, ensuring a uniform operating environment and hassle-free deployments via Docker.
🚀 This app is powered by a [Jupyter Notebook](https://jupyter.org/) environment, an open-source web application that lets you create and share documents that contain live code, equations, visualizations, and narrative text.
✅ The base image of this app incorporates [TensorFlow](https://www.tensorflow.org/), offering the flexibility to extend its capabilities for deep learning. TensorFlow is a leading open-source platform, renowned for its versatile machine learning toolkit and wide usage in handling unstructured data.
💾 This app utilizes [pandas](https://pandas.pydata.org/) for data manipulation. Pandas provides fast, flexible, and expressive data structures designed to work with structured data.
🗃️ This app leverages [XGBoost](https://xgboost.readthedocs.io/en/stable/) for gradient boosting. XGBoost is an optimized distributed gradient boosting library designed to be efficient, flexible, and is the most used library for structured, tabular data.

## Prerequisites
- [Install Docker](https://docs.docker.com/get-docker/)
- [Install Jupyter Notebook](https://jupyter.org/install#jupyter-notebook)

## Installation
1. Clone the repository:
```bash
git clone git@github.com:build-on-aws/jupyter-notebook-ml-batch-amazon-eks.git
cd jupyter-notebook-ml-batch-amazon-eks
```

## Quickstart
Follow these steps to initiate the notebook environment via Docker.

1. Build the Docker image in the root project directory.
```bash
docker build -t batch-ml-image .
```

2. Run the Docker container.
```bash
docker run --memory=4g --cpus=2 -p 8888:8888 batch-ml-image
```

## Security

See [CONTRIBUTING](CONTRIBUTING.md#security-issue-notifications) for more information.

## License

This library is licensed under the MIT-0 License. See the LICENSE file.

