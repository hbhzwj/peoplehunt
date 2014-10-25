#!/usr/bin/env python
from __future__ import print_function, division, absolute_import
import pandas as pd
data = pd.io.parsers.read_csv('mockdata/Peoplehunt_mock_data - Sheet1.csv')
print(data)
