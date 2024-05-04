test_that("is.prime key values",
          {
              expect_false(is.prime(1))
              expect_true(is.prime(2))
              expect_false(is.prime(2.5))
              expect_true(is.prime(3))
          }
)

test_that("is.prime table lookup",
          {
              prime_lookup <- fread(file.path(test_path(), "prime_lookup.csv"))
              expect_true(prime_lookup[, all(as.numeric(sapply(INPUT_NO, is.prime)) == IS_PRIME)])
          }
)

