import pandas as pd
import numpy as np
import matplotlib.pylab as plt
from itertools import cycle, islice

df_voters = pd.read_table('~/Desktop/working/duspviz/data-science/pandas-intro/data/centrecounty_precinct_results_nov2016.txt', sep=',')
df_pres = df_voters[df_voters['Contest']== 'PRESIDENTIAL ELECTORS']
grouped = df_pres.groupby('Candidate').Count.sum()
df_candidates = grouped.to_frame()

df_candidates.plot.bar(legend=True)
