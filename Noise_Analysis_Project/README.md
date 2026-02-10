# Residential Noise Analysis Project

## Overview
This project analyzes time-series noise data to objectively identify abnormal noise patterns. The goal is to visualize sound level variations and detect specific time windows with significantly high decibel levels, providing quantitative evidence for noise pollution issues.

## Key Findings
* **Temporal Patterns**: Visualized 24-hour noise distribution using boxplots.
* **Anomaly Detection**: Identified specific time frames (e.g., 02:00 - 04:00) where noise levels consistently exceeded the standard threshold (70dB+).

## Visualization Result
![Noise Analysis Report](output/noise_analysis_report.png)
*(Please ensure the image file is placed in the `output` directory)*

## Tech Stack
* **Language**: Python 3.x
* **Libraries**:
    * `pandas`: Data manipulation and time-series analysis
    * `matplotlib` / `seaborn`: Data visualization
    * `numpy`: Numerical operations

## Usage
1. **Install Dependencies**
   ```bash
   pip install pandas matplotlib seaborn numpy