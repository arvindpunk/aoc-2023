-- part a
SELECT
    sum(
        toInt64(
            concat(
                extractAll(line, '[0-9]') [1],
                extractAll(line, '[0-9]') [-1]
            )
        )
    )
FROM
    "table";

-- part b
SELECT
    sum(
        multiMatchAnyIndex(
            line,
            ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine', 'zero']
        ) % 10 * 10 + multiMatchAnyIndex(
            reverse(line),
            ['1', '2', '3', '4', '5', '6', '7', '8', '9', '0', 'eno', 'owt', 'eerht', 'ruof', 'evif', 'xis', 'neves', 'thgie', 'enin', 'orez']
        ) % 10
    )
FROM
    "table";