#let sp_config = state("scripted/config", (:))

#let default_config() = (
  check_strict: false,
  bold_slugs: true,
  dialogue_cont: true,  // Set to "false" for manual dialogue continuation
  slug_dashes: "double",  // "single" | "double"
  cont_str: "CON'D",
)

#let _validate_user_config(input_config) = {
  let keys = default_config().keys()

  for k in input_config.keys() {
    if k not in keys {
      assert(
        false,
        message: "Input config value '" + k
          + "' not expected. Expected keys: "
          + keys.join(", "),
      )
    }
  }
}