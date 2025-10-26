IBM Stock Price Analysis and Market Influence Visualizer (R/Shiny)

Project Summary:
This project analyzes IBM stock data (2022-2024) using R and the quantmod package. The core deliverable is an interactive Shiny web application that utilizes visNetwork to visualize market cause and effect. The app demonstrates a chain reaction: how factors like missed earnings or interest rates can lead to a stock drop, investor panic, and a necessary company change (strategic pivot).

Key Features
Time Series Analysis: Tracks and plots IBM's adjusted stock price data from 2022 to 2024.

Interactive Visualization: An R/Shiny dashboard that maps complex financial relationships, showing the direct linkage from root causes to final business outcomes like strategic pivots or layoffs.

Core R Packages: quantmod, ggplot2, shiny, and visNetwork.

Files in this Repository
IBM data.R
The main R script containing all code: data fetching, time series plotting, and the complete shiny application code.

RData.gz
Compressed R workspace data to ensure the environment can be fully restored.

Rhistory
A record of the commands executed, providing transparency on the project's development steps.

How to Run the Project (R Users)
To run the interactive application, you must have R and RStudio installed.
Install Required Packages: Open your R console and run the following command to install all necessary dependencies:

install.packages(c("quantmod", "ggplot2", "visNetwork", "shiny"))

Open the Script: Load the IBM data.R file into RStudio.
Execute the Script: Run the entire script. This will first generate the static stock price plot and then automatically launch the interactive Shiny app in your default web browser, displaying the cause and effect network.
