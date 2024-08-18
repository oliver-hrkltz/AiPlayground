# README.md

## Links

- [The basics of neural networks, and the math behind how they learn](https://www.3blue1brown.com/topics/neural-networks)

### Local Execution
- [Ollama](https://github.com/ollama/ollama)
- [llama.cpp](https://github.com/ggerganov/llama.cpp)
- [torchchat](https://github.com/pytorch/torchchat)

## Terms

- Artificial Intelligence (AI): A branch of computer science focused on creating systems that can perform tasks typically requiring human intelligence, such as reasoning, learning, problem-solving, and understanding natural language.
- Machine Learning (ML) A subset of AI that involves training algorithms to recognize patterns in data and make predictions or decisions without being explicitly programmed for specific tasks.
  - Supervised Learning: The model is trained on labeled data (input-output pairs).
  - Unsupervised Learning: The model is trained on data without explicit labels, often used for clustering or association tasks.
  - Reinforcement Learning: An agent learns to make decisions by receiving rewards or penalties based on its actions.
  - Deep Learning: A subset of machine learning that uses neural networks with many layers (deep neural networks) to model complex patterns in large amounts of data.
  - Transfer Learning: The practice of using a pre-trained model on a new task, leveraging knowledge learned from a different but related problem.
  - Fine-tuning: The process of adjusting a pre-trained model
- Neural Networks: Computational models inspired by the human brain, consisting of layers of interconnected nodes (neurons) that process input data.
  - Neuron: The basic unit in a neural network that performs a simple computation based on input data and weights.
  - Activation Function: A function applied to the output of a neuron to introduce non-linearity, allowing the network to model more complex patterns (e.g., ReLU, sigmoid, tanh).
  - Layer: A group of neurons in a neural network that processes input data in parallel.
    - Input Layer: The first layer of a neural network that receives the input data.
    - Hidden Layer: Layers between the input and output layers that perform intermediate processing.
    - Output Layer: The final layer that produces the network’s predictions.
- Training and Evaluation:
  - Training: The process of feeding data to a model and adjusting its parameters (weights and biases) to minimize the error in predictions.
  - Backpropagation: The algorithm used to adjust the weights of the network based on the error of predictions during training.
  - Epoch: One complete pass through the entire training dataset.
  - Batch: A subset of the training data processed together during one iteration.
  - Learning Rate: A parameter that controls the size of the step the model takes during optimization.
  - Overfitting: A situation where a model performs well on the training data but poorly on unseen data, usually due to learning noise or details specific to the training set.
  - Underfitting: A situation where a model is too simple to capture the underlying patterns in the data, resulting in poor performance on both the training and test data.
- Inference: The process that a trained machine learning model uses to draw conclusions from brand-new data. Or in simple words: Inference is an AI model in action.
- Evaluation Metrics:
  - Accuracy: The proportion of correct predictions made by the model.
  - Precision: The proportion of true positive predictions among all positive predictions.
  - Recall: The proportion of true positives identified by the model out of all actual positives.
  - F1 Score: The harmonic mean of precision and recall, providing a single measure of model performance.
  - Confusion Matrix: A table showing the performance of a classification model, with rows representing actual classes and columns representing predicted classes.
- Optimization:
  - Gradient Descent: An optimization algorithm used to minimize the loss function by iteratively adjusting the model’s parameters.
  - Stochastic Gradient Descent (SGD): A variant of gradient descent that updates the model parameters for each batch of data rather than the entire dataset.
  - Adam Optimizer: An advanced optimization algorithm that adjusts the learning rate adaptively based on first and second moments of the gradient.
- Data Preparation:
  - Feature Engineering: The process of selecting and transforming variables (features) to improve the performance of a model.
  - Normalization: The process of scaling input data so that it fits within a specific range, often used to speed up training.
  - Data Augmentation: Techniques used to increase the diversity of training data without collecting new data, such as flipping or rotating images in computer vision tasks.
- Regularization: Techniques used to prevent overfitting by penalizing complex models. Common methods include L1 (Lasso) and L2 (Ridge) regularization.
  - Dropout: A regularization technique where random neurons are ignored during training to prevent the model from becoming too dependent on specific neurons.
