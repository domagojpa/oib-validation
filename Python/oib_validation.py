from typing import Union


def check_oib(oib: Union[str, int]) -> bool:
    """Check if OIB is valid and return True if it is."""
    OIB_LEN = 11
    if isinstance(oib, int):
        oib = str(oib).zfill(OIB_LEN)

    if len(oib) != OIB_LEN or not oib.isdigit():
        return False

    a = 0
    for c in oib[:-1]:
        a += int(c)
        a = a % 10
        if a == 0:
            a = 10
        a *= 2
        a = a % 11

    kontrolni = OIB_LEN - a
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
