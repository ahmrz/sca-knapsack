# Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm

This repository contains code used in the paper, ["Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm"](https://doi.org/10.1109/PICICT53635.2021.00020). The [Sine Cosine Algorithm (SCA)](https://doi.org/10.1016/j.knosys.2015.12.022), developed by Seyedali Mirjalili, belongs to the class of metaheuristic algorithms used to solve optimization problems. In this paper, a modified binary variation of SCA was designed to solve multiple 0-1 knapsack problems, and the performance was compared with other metaheuristic algorithms.

## Abstract
Optimization is no easy task and from a computational point of view, it often involves scanning a large search space to find the best solution that adheres to all the constraints and desired specifications. Designing a customized algorithm to solve several optimization problems is also a challenging task, therefore scientists and engineers utilize metaheuristic algorithms that can provide an optimal solution within a reasonable time. This optimal solution may or may not be the best solution in the search space, but it is usually good enough to satisfy the requirements without wasting computational resources or time. The 0–1 knapsack problem is a constraint-based optimization problem in which a number of items have to be packed into a container by maximizing the value of the items in the container while also adhering to the weight limit of the container. In this paper, the sine-cosine algorithm (SCA) is adopted to solve 0–1 knapsack problems. The proposed algorithm is called the binary sine-cosine algorithm (BSCA). Due to the binary nature of the 0–1 knapsack problem, the SCA is manipulated using a mapping function. The performance of the proposed BSCA is evaluated using 15 well-known datasets. Furthermore, the performance of the proposed BSCA is compared with other comparative algorithms (i.e., GA, PSO, and BFPA) from the literature using the same datasets. It can be observed from the results that the performance of the proposed BSCA is similar to other algorithms by obtaining the optimal results on 10 datasets. The results of the proposed BSCA are convergent with others for the remaining five datasets.

The complete paper can be viewed at [https://doi.org/10.1109/PICICT53635.2021.00020](https://doi.org/10.1109/PICICT53635.2021.00020).

## Instructions to run code

Make sure you have Matlab or Octave installed on your computer. See [Matlab website](https://www.mathworks.com/products/matlab.html) or [Octave website](https://octave.org/download) for more details. Clone the repository, navigate to the `knapsack` folder, and type in the terminal for Matlab:

```console
matlab main.m
```

For Octave, type in the terminal:

```console
octave main.m
```


## Citing the paper

BibTeX:

```console
@inproceedings{mahfouz2021solving,
  title={Solving 0--1 Knapsack Problems Using Sine-Cosine Algorithm},
  author={Mahfouz, Khaled and Ali, Sharaz and Al-Betar, Mohammed Azmi and Awadallah, Mohammed A},
  booktitle={2021 Palestinian international conference on information and communication technology (PICICT)},
  pages={45--51},
  year={2021},
  organization={IEEE}
}

```



| Type  | Citation |
| :------------- | :------------- |
| MLA  | Mahfouz, Khaled, et al. "Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm." _2021 Palestinian international conference on information and communication technology (PICICT)_. IEEE, 2021.  |
| APA  | Mahfouz, K., Ali, S., Al-Betar, M. A., & Awadallah, M. A. (2021, September). Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm. In _2021 Palestinian international conference on information and communication technology (PICICT)_ (pp. 45-51). IEEE.  |
| Chicago  | Mahfouz, Khaled, Sharaz Ali, Mohammed Azmi Al-Betar, and Mohammed A. Awadallah. "Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm." In _2021 Palestinian international conference on information and communication technology (PICICT)_, pp. 45-51. IEEE, 2021. |
| Harvard | Mahfouz, K., Ali, S., Al-Betar, M.A. and Awadallah, M.A., 2021, September. Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm. In _2021 Palestinian international conference on information and communication technology (PICICT)_ (pp. 45-51). IEEE. |
| Vancouver | Mahfouz K, Ali S, Al-Betar MA, Awadallah MA. Solving 0–1 Knapsack Problems Using Sine-Cosine Algorithm. In2021 Palestinian international conference on information and communication technology (PICICT) 2021 Sep 28 (pp. 45-51). IEEE. |

