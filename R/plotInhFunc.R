#' Plots and prints stop-signal delays and accuracies
#'
#' Plots and prints stop-signal delays and corresponding accuracies. For studies that use fixed (randomly chosen on each trial from a pre-determined set) stop-signal delays.
#' @export
#' @param df  Dataframe with response time, accuracy, indication whether trial is stop or go, and delays for a given trial.
#' @param stop_col Name of the column in the dataframe \code{df} that indicates whether a given trial is a "stop" or a "go" trial ( 0 = go, 1 = stop)
#' @param acc_col Name of the column in the dataframe \code{df} that contains accuracy of inhibition ( 0 = incorrect, 1 = correct)
#' @param ssd_col Name of the column in the dataframe \code{df} that contains stop-signal delays
#' @return Line plot of the inhibition function.
#' @examples \dontrun{plotInhFunc(df = df, stop_col='vol', ssd_col='soa', acc_col='agn_acc')}








plotInhFunc <- function(df, stop_col, ssd_col, acc_col) {

  stop_trials <- df[ which(df[,stop_col]==1), ]
  soas <- unique(stop_trials[,ssd_col])
  soas <- sort(soas)
  acc_vec <- c()
  for (soa in soas){
    stp_tr <- stop_trials[ which(stop_trials[,ssd_col]==soa), ]
    total_stops <- sum(stp_tr[,acc_col])
    total_trials <- nrow(stp_tr)
    ssd_acc <- total_stops/total_trials
    acc_vec <- c(acc_vec, ssd_acc)
    print(soa)
    print(ssd_acc)
  }
  plot_df <- data.frame(acc_vec, soas)
  plot(soas, acc_vec, type = 'l', xlab = 'Stop-signal delays', ylab = 'Accuracy', main = 'Inhibition function', col ='red', lwd=3)

}


