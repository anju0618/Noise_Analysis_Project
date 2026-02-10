import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns

df = pd.read_csv('noise_log_202207.csv')


df['timestamp'] = pd.to_datetime(df['timestamp'])

df['hour'] = df['timestamp'].dt.hour


plt.style.use('bmh') 
plt.figure(figsize=(12, 10))

# plot
plt.subplot(2, 1, 1) 
plt.plot(df['timestamp'], df['db_level'], color='steelblue', alpha=0.7, label='Noise Level (dB)')
# 異常値
anomalies = df[df['db_level'] > 70]
plt.scatter(anomalies['timestamp'], anomalies['db_level'], color='red', label='Anomalies (>70dB)', zorder=5)

plt.title('Noise Level Monitoring (2022/07)')
plt.ylabel('dB')
plt.legend()
plt.grid(True)

# 箱ひげ図
plt.subplot(2, 1, 2)
sns.boxplot(x='hour', y='db_level', data=df, palette='coolwarm')

plt.title('Noise Distribution by Hour (Evidence of Late Night Noise)')
plt.xlabel('Hour of Day')
plt.ylabel('dB')
plt.axhline(y=70, color='red', linestyle='--', label='Threshold (70dB)') # 閾値線
plt.legend()


plt.tight_layout()
plt.savefig('noise_analysis_report.png')