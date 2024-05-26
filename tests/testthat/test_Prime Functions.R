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

test_that("get prime divisors",
          {
              expect_equal(get_prime_divisors(1), NULL)
              expect_equal(get_prime_divisors(2), 2)
              expect_equal(get_prime_divisors(3), 3)
              expect_equal(get_prime_divisors(4), c(2, 2))
              expect_equal(get_prime_divisors(5), 5)
              expect_equal(get_prime_divisors(6), c(2, 3))
              expect_equal(get_prime_divisors(28), c(2, 2, 7))
          })
