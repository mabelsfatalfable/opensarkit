library(shiny)
library(shinydashboard)
library(shinyFiles)
library(RSQLite)
library(RColorBrewer)
library(shinyjs)
source("helpers.R")
server <- function(input, output, session) {
  
   #------------------------------------------------------------------------------------------------
   # Source Alos K&C
   source(file.path("server","ALOS_KC_dow_server.R"), local=TRUE)$value
   source(file.path("server","ALOS_KC_pro_server.R"), local=TRUE)$value
   source(file.path("server","ALOS_KC_fnf_server.R"), local=TRUE)$value
   #source(file.path("server","ALOS_ASF_inv_tab_server.R"), local=TRUE)$value
   #source(file.path("server","ALOS_ASF_grd2rtc_tab_server.R"), local=TRUE)$value
   #------------------------------------------------------------------------------------------------
   
   #------------------------------------------------------------------------------------------------
   # source S1 server files
   source(file.path("server","S1_inv_tab_server.R"), local=TRUE)$value
   source(file.path("server","S1_dow_tab_server.R"), local=TRUE)$value
  
   source(file.path("server","S1_grd2gtc_tab_server.R"), local=TRUE)$value 
   source(file.path("server","S1_grd2rtc_tab_server.R"), local=TRUE)$value
  
   source(file.path("server","S1_rtc2ts_tab_server.R"), local=TRUE)$value
   source(file.path("server","S1_ts2mos_tab_server.R"), local=TRUE)$value
   #------------------------------------------------------------------------------------------------
   
   #------------------------------------------------------------------------------------------------
   #mapviewOptions(raster.palette = colorRampPalette(brewer.pal(9, "Greys")))
   #n=mapview(raster("/home/avollrath/Projects/UGA/DEM/DEM_SRTM3V4.1.tif"), legend = TRUE)
   #output$mapplot <- renderMapview(n)
   #------------------------------------------------------------------------------------------------
      
   #------------------------------------------------------------------------------------------------
   # end session by 
   session$onSessionEnded(stopApp)
   
   #-----------------------------------------------------------
   # Links to other tabs
   # Getting started - about
   observeEvent(input$link_to_tabpanel_about, {
     updateTabItems(session, "menus", "about")
   })

   # SAR theory
   observeEvent(input$link_to_tabpanel_sarhistory, {
     updateTabItems(session, "menus", "SARhistory")
   })
      
   # SAR theory
   observeEvent(input$link_to_tabpanel_sartheory, {
   updateTabItems(session, "menus", "SARtheory")
   })
    
   # SAR missions
   observeEvent(input$link_to_tabpanel_sarmissions, {
   updateTabItems(session, "menus", "SARmissions")
   })
    
   # SAR image interpretation
   observeEvent(input$link_to_tabpanel_sarimage, {
   updateTabItems(session, "menus", "SARimage")
   })
    
   # SAR references
   observeEvent(input$link_to_tabpanel_sarrefs, {
   updateTabItems(session, "menus", "SARrefs")
   })
    
   # ALOS K&C download
   observeEvent(input$link_to_tabpanel_alos_kc_dow, {
   updateTabItems(session, "menus", "alos_kc_dow")
   })
   
   # ALOS K&C processing
   observeEvent(input$link_to_tabpanel_alos_kc_pro, {
     updateTabItems(session, "menus", "alos_kc_pro")
   })
   
   # ALOS K&C FNF
   observeEvent(input$link_to_tabpanel_alos_kc_fnf, {
     updateTabItems(session, "menus", "alos_kc_fnf")
   })
   
   # ALOS ASF inventory
   observeEvent(input$link_to_tabpanel_alos_inv, {
   updateTabItems(session, "menus", "alos_inv")
   })
   
   # ALOS ASF grd2rtc
   observeEvent(input$link_to_tabpanel_alos_grd2rtc, {
   updateTabItems(session, "menus", "alos_grd2rtc")
   })
   
   # S1 data
   observeEvent(input$link_to_tabpanel_s1_data, {
     updateTabItems(session, "menus", "s1_data")
   }) 
   # S1 inventory
   observeEvent(input$link_to_tabpanel_s1_inv, {
   updateTabItems(session, "menus", "s1_inv")
   })
   # 
   # S1 download
   observeEvent(input$link_to_tabpanel_s1_dow, {
   updateTabItems(session, "menus", "s1_dow")
   })
   
   # S1 grd2gtc
   observeEvent(input$link_to_tabpanel_s1_grd, {
     updateTabItems(session, "menus", "s1_grd")
   })
   
   # S1 grd2gtc
   observeEvent(input$link_to_tabpanel_s1_grd2gtc, {
     updateTabItems(session, "menus", "s1_grd2gtc")
   })
   
   # S1 grd2rtc
   observeEvent(input$link_to_tabpanel_s1_grd2rtc, {
   updateTabItems(session, "menus", "s1_grd2rtc")
   })
    
   # S1 rtc2ts
   observeEvent(input$link_to_tabpanel_s1_rtc2ts, {
   updateTabItems(session, "menus", "s1_rtc2ts")
   })
   
   # S1 ts2m
   observeEvent(input$link_to_tabpanel_s1_ts2mos, {
   updateTabItems(session, "menus", "s1_ts2mos")
   })
   
   # S1 SLC
   observeEvent(input$link_to_tabpanel_s1_slc, {
     updateTabItems(session, "menus", "s1_slc")
   })
   
   # S1 SLC2COH
   observeEvent(input$link_to_tabpanel_s1_slc2coh, {
     updateTabItems(session, "menus", "s1_slc2coh")
   })
   
   # S1 SLC2POL
   observeEvent(input$link_to_tabpanel_s1_slc2pol, {
     updateTabItems(session, "menus", "s1_slc2pol")
   })
   
   # S1 SLC2IFG
   observeEvent(input$link_to_tabpanel_s1_slc2ifg, {
     updateTabItems(session, "menus", "s1_slc2ifg")
   })
} # EOF
