import pandas as pd
from sklearn.preprocessing import MinMaxScaler

age_data = pd.read_csv("data.csv")["AGE"].tolist()
age_data.append(60)

data = pd.DataFrame(age_data)
# print(data.shape)
scaler = MinMaxScaler()
age_data = scaler.fit_transform(data)
print(age_data[len(age_data)-1])
# df = pd.DataFrame(20)
# # age_data = age_data.append(len(age_data),20)
# age_data = age_data.append(df)
# # age_data.append(20)

# print(age_data)