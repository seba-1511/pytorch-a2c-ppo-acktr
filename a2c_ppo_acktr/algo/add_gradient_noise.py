#!/usr/bin/env python3

import torch as th
from torch.distributions import MultivariateNormal

def add_gradient_noise(parameters, gradient_noise):
    for param in parameters:
        param.grad += th.randn_like(param.grad.data) * gradient_noise
