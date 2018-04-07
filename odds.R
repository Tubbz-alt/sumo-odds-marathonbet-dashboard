library(tidyverse)

library(data.world)
set_config(cfg_env(auth_token_var = "DW_API_TOKEN"))

options(stringsAsFactors = FALSE)

"sumo-betting-odds" %>% 
	paste(Sys.getenv("DW_USER"), ., sep = "/") %>% 
	download_file_as_data_frame(file_name = "marathonbet.csv") %>% 
	mutate(
		ts = as.POSIXct(ts),
		basho = format(ts, "%Y-%m")
	) %>% 
	write_csv("odds.csv")
