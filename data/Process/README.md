# Process model data

These descriptions were taken from [8].

## XOMO

XOMO was introduced in [^me05] and is a general framework for Monte Carlo simulations that combine four COCOMO-like process models from Barry Boehm's group at USC. XOMO has four objectives:
- Reduce project risk
- Reduce development effort
- Reduce predicted defects
- Reduce total months of development

The variables used are described below, and takes values in the range  1..6.

| Variable  | Description   |
|-------------- | -------------- |
| prec    | Have we done this before?     |
| flex    | Development flexibility |
| resl    | Any risk resolution activities? |
| team    | Team cohesion |
| pmat    | Process maturity |
| acap    | Analyst capability |
| pcap    | Programmer capability |
| pcon    | Programmer continuity |
| aexp    | Analyst experience |
| pexp    | Programmer experience |
| ltex    | Language and tool experience |
| tool    | Tool use |
| site    | Multiple site development |
| sced    | Length of schedule |
| rely    | Required reliability |
| data    | Secondary memory requirements |
| cplx    | Program complexity |
| ruse    | Software reuse |
| docu    | Documentation requirements |
| time    | Runtime pressure |
| stor    | Main memory requirements |
| pvol    | Platform volatility |

This directory contains four scenarios taken from NASA's Jet Propulsion Lab [7]. Flight and ground are general descriptions of all flight and ground software, and OSP and OSP2 represent two versions of the Orbital Space Plane flight guidance system. In order of complexity: OSP = OSP2 < Ground < Flight.

## POM3

POM3 is a model of the management challenge specific to Agile development [^boehm03] [3-4]. In particular, it simulates Boehm & Turner's model of agile programming [5] where teams select tasks as they appear in the scrum backlog. The goals of POM3 are:
- Increase completion rates
- Reduce idle rates
- Reduce overall cost

The inputs to the model are below:

| Short name  | Decision   | Description   |
|-------------- | -------------- | -------------- |
| Cult    | Culture     | Percent of requirements that change     |
| Crit    | Criticality | Requirements cost effect for safety-critical systems |
| Crit.Mod | Criticality modifier | Percentage of teams affected by criticality |
| Init. Kn | Initial Known | Percentage of initially known requirements |
| Inter-D | Inter-dependency | Percentage of requirements that have inter-dependencies with other teams |
| Dyna    | Dynamism | Rate of how new requirements are made |
| Size    | Size    | Number of base requirements in the project |
| Plan    | Plan | Prioritization strategy, see below |
| T.Size  | Team size | Number of personnel in each team |

Where the prioritization strategy values are:
- 0: Cost ascending
- 1: Cost descending
- 2: Value ascending
- 3: Value descending
- 4: Cost/Value ascending
- 5: Cost/Value descending

There are three sets of POM models: POM3a covers a wide range of projects; POM3b represents small and highly critical projects; POM3c represents large and dynamic projects, where cost and value can be altered over a wide range. In order of complexity, POM3a < POM3b < POM3c [6].

 
[^me05]: Menzies, Tim, and Julian Richardson. "Xomo: Understanding development options for autonomy." COCOMO forum. Vol. 2005.

[^boehm03]: Boehm, Barry, and Richard Turner. "Using risk to balance agile and plan-driven methods." Computer 36.6 (2003): 57-66.
 
[3] Boehm, Barry W., and Richard Turner. Balancing agility and discipline: A guide for the perplexed. Addison-Wesley Professional, 2004.
[4] Port, Dan, Alexy Olkov, and Tim Menzies. "Using simulation to investigate requirements prioritization strategies." 2008 23rd IEEE/ACM International Conference on Automated Software Engineering. IEEE, 2008.
[5] Boehm, Barry W., et al. Software cost estimation with Cocomo II with Cdrom. Prentice Hall PTR, 2000.
[6] Lekkalapudi, Naveen Kumar. Cross trees: Visualizing estimations using decision trees. West Virginia University, 2014.
[7] Menzies, Tim, et al. "How to avoid drastic software process change (using stochastic stability)." 2009 IEEE 31st International Conference on Software Engineering. IEEE, 2009.
[8] Chen, Jianfeng, et al. "“Sampling” as a baseline optimizer for search-based software engineering." IEEE Transactions on Software Engineering 45.6 (2018): 597-614.
