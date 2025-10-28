📊 IBM Stock Analysis & Market Risk Visualizer (R/Shiny)

🎯 Project Overview

This project provides a financial time series analysis of IBM stock data (2022-2024) using R. The core deliverable is an interactive Shiny web application that visualizes complex market cause and effect relationships using a network diagram.

The goal is to clearly show the chain reaction:
Missed Earnings ➡️ Investor Panic ➡️ Stock Drop ➡️ Strategic Pivot/Layoffs

✨ Key Features

Feature

Description

Tools Used

Time Series Plot

Cleanly plots IBM's adjusted stock price over time (2022-2024) for trend identification.

quantmod, ggplot2

Interactive Network

A dynamic network diagram demonstrating causal linkages between financial and business factors.

shiny, visNetwork

Financial Modeling

Focuses on modeling how external pressures translate into internal corporate action.

R

🛠️ Technology Stack

Category

Tool / Package

Language

R

Data Fetching

quantmod (Yahoo Finance)

Visualization

ggplot2 (Time Series), visNetwork (Network Diagram)

Deployment

shiny (Interactive Web App)

🚀 How to Run the App Locally

To test the interactive Shiny app, you will need R and RStudio installed.

Clone the Repository:

git clone [https://github.com/your-username/IBM_Stock_Analysis_R_Shiny.git](https://github.com/your-username/IBM_Stock_Analysis_R_Shiny.git)
cd IBM_Stock_Analysis_R_Shiny


Install Packages: Run this command in your R console:

install.packages(c("quantmod", "ggplot2", "visNetwork", "shiny"))


Execute the Script: Open the IBM data.R file in RStudio and click the "Run App" button, or run the entire script. The time series plot will generate, and the interactive network visualizer will launch in your browser.

📂 Repository Contents

File

Purpose

IBM data.R

Primary R script containing all data fetching, analysis, and the full Shiny app code.

RData.gz

R workspace snapshot for easy state restoration.

Rhistory

Command history log showing the project development steps.
