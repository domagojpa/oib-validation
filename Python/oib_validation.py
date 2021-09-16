from typing import Union


def check_oib(oib: Union[str, int]) -> bool:
    """Check if OIB is valid and return True if it is."""
    OIB_LEN = 11
    if isinstance(oib, int):
        oib = str(oib)

    if len(oib) != OIB_LEN or not oib.isdigit():
        return False

    medu_ostatak = 0
    for digit in oib[:-1]:
        medu_ostatak += int(digit)
        medu_ostatak %= 10
        if medu_ostatak == 0:
            medu_ostatak = 10
        medu_ostatak *= 2
        medu_ostatak %= 11

    kontrolni = OIB_LEN - medu_ostatak
    if kontrolni == 10:
        kontrolni = 0

    return kontrolni == int(oib[-1])


if __name__ == '__main__':
    import sys
    try:
        oib = sys.argv[1]
    except IndexError:
        oib = input('Unesi OIB: ')
    print(check_oib(oib))
