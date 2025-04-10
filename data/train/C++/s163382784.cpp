#include <array> 
#include <cstdio>
#include <type_traits>

template <std::size_t...>
struct index_tuple {};
 
namespace detail {
 
template <typename IndexTuple, std::size_t Next>
struct index_range_next;
template <std::size_t... Indices, std::size_t Next>
struct index_range_next<index_tuple<Indices...>, Next> {
 public:
  typedef index_tuple<Indices..., (Indices + Next)...> type;
};
 
template <typename IndexTuple, std::size_t Next, std::size_t Tail>
struct index_range_next2;
template <std::size_t... Indices, std::size_t Next, std::size_t Tail>
struct index_range_next2<index_tuple<Indices...>, Next, Tail> {
 public:
  typedef index_tuple<Indices..., (Indices + Next)..., Tail> type;
};
 
template <std::size_t First, std::size_t Step, std::size_t N,
          typename Enable = void>
struct index_range_impl;
template <std::size_t First, std::size_t Step, std::size_t N>
struct index_range_impl<First, Step, N,
                        typename std::enable_if<(N == 0)>::type> {
 public:
  typedef index_tuple<> type;
};
template <std::size_t First, std::size_t Step, std::size_t N>
struct index_range_impl<First, Step, N,
                        typename std::enable_if<(N == 1)>::type> {
 public:
  typedef index_tuple<First> type;
};
template <std::size_t First, std::size_t Step, std::size_t N>
struct index_range_impl<First, Step, N,
                        typename std::enable_if<(N > 1 && N % 2 == 0)>::
                            type> : public detail::
                                        index_range_next<
                                            typename detail::index_range_impl<
                                                First, Step, N / 2>::type,
                                            First + N / 2 * Step> {};
template <std::size_t First, std::size_t Step, std::size_t N>
struct index_range_impl<First, Step, N,
                        typename std::enable_if<(N > 1 && N % 2 == 1)>::
                            type> : public detail::
                                        index_range_next2<
                                            typename detail::index_range_impl<
                                                First, Step, N / 2>::type,
                                            First + N / 2 * Step,
                                            First + (N - 1) * Step> {};
 
template <std::size_t First, typename IndexTuple>
struct index_range_helper;
template <std::size_t First, std::size_t... Indices>
struct index_range_helper<First, index_tuple<Indices...>> {
 public:
  typedef index_tuple<(Indices + First)...> type;
};
 
}  // namespace detail
 
template <std::size_t First, std::size_t Last, std::size_t Step = 1>
struct index_range
    : public detail::index_range_helper<
          First, typename detail::index_range_impl<
                     0, Step, ((Last - First) + (Step - 1)) / Step>::type> {};

namespace detail {

template <std::size_t N, std::size_t... Indices>
std::array<int, 9> solve_impl(const index_tuple<Indices...>&) {
    return std::array<int, 9>{{printf("%ldx%ld=%ld\n", (N + 1), (Indices + 1), ((N + 1) * (Indices + 1)))...}};
}
    
template <std::size_t... Indices>
std::array<std::array<int, 9>, 9> solve(const index_tuple<Indices...>& t) {
    return std::array<std::array<int, 9>, 9>{{solve_impl<Indices>(t)...}};
}
    
}  // namespace detail

std::array<std::array<int, 9>, 9> solve() {
    return detail::solve(typename index_range<0, 9>::type());
}

int main() { solve(); }