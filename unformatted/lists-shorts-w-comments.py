def bad_format(  ) -> tuple[int, int, int, int, int, int, int, int, int, int, int]:
    oneline1 = [1, 10, 1000]
    oneline2 = [1,
                10,    # foo
                1000]  # bar
    oneline3 = [1, 10, 1000,]
    oneline4 = [1,
                10,     # baz
                1000,]  # boz


