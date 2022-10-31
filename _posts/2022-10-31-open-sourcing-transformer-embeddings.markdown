---
layout: post
title: "Open Sourcing Transformer Embeddings"
date: 2022-10-28
categories: [nlp, data science, open source]
author: Setu Shah
---

The Data Science team at Headspace Health is a heavy user of building, training and productionizing transformer-based NLP models.

Depending on the application, our NLP models operate at varying levels of atomicity: token, word, phrase, sentence, paragraph and document. A lot of our models rely on embeddings from off-the-shelf [Transformer-based models](https://huggingface.co/models), while some are fine-tuned for the application we are building for. Similarly, as a part of our work, we often try out different models during exploration, while comparing various pooling methods.

About 18 months ago, we discovered the need for a streamlined way to use embeddings across our work for our exploration and production use cases. That is when we started building `transformer-embeddings`, an internal Python package that made it easy to interact with transformer-based models that are built using [PyTorch](https://pytorch.org/).

Today, we are [open-sourcing this package](https://github.com/ginger-io/transformer-embeddings/) and [publishing it to PyPI](https://pypi.org/project/transformer-embeddings/) to make it easy for anyone in the transformer and NLP communities to be able to use aggregated and pooled embeddings for phrases, sentences and paragraphs and documents, at varying levels of aggregation, in any of their applications.

### You should use this if you want to...

- Automatically apply tokenization (with the model defaults) before your model's forward pass.
- Stack outputs from the model into a single, iterable array that map 1:1 with your input.
- Simplify interactions with any transformer model available on the [HuggingFace Model Hub](https://huggingface.co/models) for exploration and inference.
- Easily compare the impact of and then apply different pooling strategies (mean, max, min, pooler) on your downstream tasks.
- Use your model on CPUs or GPUs, without worrying about if you asked PyTorch to use the right device.
- Export the model and additional artifacts (custom scikit-learn / tree-based models, model cards, etc.) to S3.
- Customize batch for different models as you play with them.

## You should _not_ use this if you want to...

- Fine-tune the underlying embedding models or train new models. (We recommend [HF `transformers`](https://github.com/huggingface/transformers) or [`sentence-transformers`](https://github.com/UKPLab/sentence-transformers) as alternatives.)
- Use TensorFlow / JAX for your deep learning models.

`transformer-embeddings` is a battle-tested package for generating embeddings from transformer models in 10+ of our internal production workflows, running on CPUs and GPUs, for real-time and batch inference. We hope you use it, like it and it makes it easier for you to use transformer models, as it has for us :).

## Questions or suggesstions?

Email us at <a href="mailto:transformer-embeddings@headspace.com">transformer-embeddings@headspace.com</a>.
