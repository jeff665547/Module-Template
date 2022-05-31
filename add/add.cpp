#include "add_header/add.h"

#include <limits>

int Add::add(int l, int r, STATUS::calc_status& cs) noexcept {
    if((l > 0) && (r > (std::numeric_limits<int>::max() - l))){
        cs = STATUS::calc_status::positive_overflow;
        return 0;
    }else if((l < 0) && (r < (std::numeric_limits<int>::min() - l))){
        cs = STATUS::calc_status::negative_overflow;
        return 0;
    }
    cs = STATUS::calc_status::success;
    return l + r;
}