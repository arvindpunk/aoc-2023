-- part a
SELECT
    sum(
        toInt64(splitByChar(' ', splitByChar(':', line) [1]) [2]) * arrayAll(
            m -> m ['red'] <= 12
            AND m ['green'] <= 13
            AND m ['blue'] <= 14,
            arrayMap(
                x -> mapApply(
                    (k, v) -> (v, toInt64(k)),
                    extractKeyValuePairs(x, ' ', ',')
                ),
                splitByString('; ', trim(splitByChar(':', line) [2]))
            )
        )
    )
FROM
    "table";

-- part b
SELECT
    sum(
        arrayProduct(
            arrayFold((acc, m) -> [max2(acc[1], m ['red']),
            max2(acc [2], m ['green']),
            max2(acc [3], m ['blue']) ],
            arrayMap(
                x -> mapApply(
                    (k, v) -> (v, toInt64(k)),
                    extractKeyValuePairs(x, ' ', ',')
                ),
                splitByString('; ', trim(splitByChar(':', line) [2]))
            ),
            [0., 0., 0.]
        )
    )
)
FROM
    "table";