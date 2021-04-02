#' SSRT using mean method for studies with "fixed" method of setting SSD
#'
#' Estimating SSRT using mean method for studies that use fixed (randomly chosen on each trial from a pre-determined set) stop-signal delays
#'
#' @export
#' @param df  Dataframe with response time, accuracy, indication whether trial is stop or go, and delays for a given trial.
#' @param stop_col Name of the column in the dataframe \code{df} that indicates whether a given trial is a "stop" or a "go" trial ( 0 = go, 1 = stop)
#' @param rt_col Name of the column in the dataframe \code{df} that contains response time in seconds
#' @param acc_col Name of the column in the dataframe \code{df} that contains accuracy of inhibition ( 0 = incorrect, 1 = correct)
#' @param ssd_col Name of the column in the dataframe \code{df} that contains stop-signal delays
#' @param ssd_list List of stop-signal delays used in the experiment
#' @return  Stop-signal reaction time corresponding roughly to 50% inhibition accuracy
#' @examples \dontrun{mean_fixedSSD(df = results_df, rt_col = 'RT', stop_col = 'stopgo', acc_col = 'sst_acc',
#' ssd_col = 'soa', ssd_list = c(0.1, 0.2, 0.3, 0.5, 0.6))}
#'
#'
#'
#'
mean_fixedSSD <- function(df, stop_col, rt_col, acc_col, ssd_col, ssd_list) {

  stop_trials <- df[ which(df[,stop_col]==1), ]
  go_trials <- df[ which(df[,stop_col] == 0),]
  d <- NULL
  for (ssd in ssd_list){

    stop_chunck <- stop_trials[ which(stop_trials[,ssd_col]==ssd), ]
    ssd_acc <- length(stop_chunck[,acc_col])/sum(stop_chunck[,acc_col])
    df_ssd_acc <- data.frame(ssd_acc,ssd)
  }

  df_total <- rbind(d,df)
  f_of_ssd <- splinefun(ssd_acc,ssd)

  z <- f_of_ssd(0.5, deriv = 0)
  meanRTGO <- mean(go_trials[, rt_co], na.rm = TRUE)
  ssrt_raw = meanRTGO - z
  if(isTRUE(ssrt_raw < 0)){
    ssrt <- NA
  } else {
    ssrt <- ssrt_raw
  }

  return(ssrt)

}
