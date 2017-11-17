args = commandArgs(trailingOnly = TRUE)

if(length(args) < 2){
  stop("Input arguments should be greater than 2")
}else{
  input_file = args[1]
  before_file = args[2]
  after_file = args[3]
  output_file = args[4]
  if(before_file == 'NULL'){
    before_file = NULL
  }
  if(after_file == 'NULL'){
    after_file = NULL
  }
  print(paste("Input file is:", input_file))
  print(paste("Before file is:", before_file))
  print(paste("After file is:", after_file))
  print(paste("Output file is:", output_file))
  print(paste("Loading file..."))
  dat = mHealthR::mhealth.read(file = input_file, filetype = "sensor")
  if(!is.null(before_file)){
    print("Get the last 2 minutes data for before file")
    before_dat = mHealthR::mhealth.read(file = before_file, filetype = "sensor")
    before_dat = mHealthR::mhealth.clip(before_dat, start_time = dat[1,1] - 120, stop_time = dat[1,1], file_type = "sensor")
  }else{
    before_dat = NULL
  }
  if(!is.null(after_file)){
    print("Get the first 2 minutes data for after file")
    after_dat = mHealthR::mhealth.read(file = after_file, filetype = "sensor")
    after_dat = mHealthR::mhealth.clip(after_dat, start_time = dat[nrow(dat),1], stop_time = dat[nrow(dat),1] + 120, file_type = "sensor")
  }else{
    after_dat = NULL
  }

  print(paste("Computing MIMS-unit..."))
  output_dat = MIMSunit::mims_unit(df = dat, breaks = "1 min", range = c(-6, 6), before_df = before_dat, after_df = after_dat)
  print(paste("Saving MIMS-unit..."))
  write.csv(x = output_dat, file = output_file, append = FALSE, quote = FALSE, row.names = FALSE)
  print(paste("Completed"))
}