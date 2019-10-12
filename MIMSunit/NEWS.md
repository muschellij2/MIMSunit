# MIMSunit 0.6.0

* Add dev dependencies to renv

## Breaking changes

* Add two datasets for experiment results (see [this article](/articles/cross_device_consistency.html)).
* Move MIMSunit R project one level down to a subdirectory to better support git submodules.
* Add [`MIMSunit-dataset-shaker`](https://github.com/qutang/MIMSunit-dataset-shaker) as submodule.

# MIMSunit 0.5.10

* Exclude data from package building.
* Exclude inst scripts, figures, tables and data from package building.
* Remove unused files in R folder.

## Breaking changes

* Use `renv` for dependency management.
* CRAN ready.


# MIMSunit 0.5.7

* Refactor functions in `mims_unit.R`.

## Breaking changes

* API changes for the following functions. Please refer to the documentations for the details.
  * `sensor_orientations()` is Added as an entry function to compute sensor orientations.
  * `mims_unit()` is simplified to not allow customization on parameters.
  * Old `mims_unit()` is now `custom_mims_unit()`, which allows full tuning of algorithm parameters.

# MIMSunit 0.5.6

* Refactor functions in `extrapolate.R`, `interpolate.R` and `simulate_data.R`.

## Breaking changes

* API changes for the following functions. Please refer to the documentations for the details.
  * `crop_grange()` is now `cut_off_signal()`
  * `make_new_data()` is now `simulate_new_data()`
  * `extrapolate.data.frame()` is now `extrapolate()`
  * `extrapolate()` is now `extrapolate_single_col()`

# MIMSunit 0.5.5

* Added a `NEWS.md` file to track changes to the package.
* Refactor functions in `import_data.R` file.

## Breaking changes

* API changes for the following functions. Please refer to the documentations for the details.
  * `import_actigraph_raw()` is now `import_actigraph_csv()`
  * `import_actigraph_count()` is now `import_actigraph_count_csv()`
  * `import_biobank_enmo()` is now `import_enmo_csv()`
  * `import_activpal_raw()` is now `import_activpal3_csv()`