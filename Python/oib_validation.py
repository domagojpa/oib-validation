from typing import Union

OIB_LEN = 11

class OIB:
    @staticmethod
    def validate(oib: Union[str, int]) -> bool:
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
    print(OIB.validate('** enter your oib**'))
