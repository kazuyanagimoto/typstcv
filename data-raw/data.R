educ <- data.frame(
  title = c("Ph.D. in Physics", "Master of Science"),
  location = c("Zürich, Switzerland", "Zürich, Switzerland"),
  date = c("1905", "1896 - 1900"),
  description = c("University of Zürich", "ETH")
)

pub <- data.frame(
  title = c("On the Electrodynamics of Moving Bodies",
            "On the motion of small particles suspended in liquids at rest required by the molecular-kinetic theory of heat"),
  location = c("Annalen der Physik", "Annalen der Physik"),
  date = c("September 1905", "July 1905")
)

work <- data.frame(
  title = c("Associate Professor", "Junior Professor", "Technical Assistant"),
  location = c("Zürich, Switzerland", "Bern, Switzerland", "Bern, Switzerland"),
  date = c("1909 - 1911", "1908 - 1909", "1902 - 1908"),
  description = c("University of Zürich", "University of Bern", "Federal Patent Office")
)

award <- data.frame(
  title = c("Nobel Prize in Physics"),
  location = c("Stockholm, Sweden"),
  date = c("1921"),
  description = c("For his services to Theoretical Physics, and especially for his discovery of the law of the photoelectric effect.")
)

skill <- data.frame(
  title = c("Programming", "Languages", "Tools"),
  description = c("Python, C++, Fortran", "German (Native), English (Fluent), French (Intermediate)", "Typst, Quarto, LaTeX")
)

#-------------------------------------------------------------------------------
# Save data
#-------------------------------------------------------------------------------
usethis::use_data(educ, pub, work, award, skill, overwrite = TRUE)
