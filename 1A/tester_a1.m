function [test_case_n, test_case_b, times_tot, errors] = tester_a1(loop_arr)

  times_tot = [];
  errors = [];
  test_case_n = [];
  test_case_b = [];

  for i=loop_arr
    [t, e] = generate_test_1a(i, 1);
    times_tot = [times_tot t];
    errors = [errors, e];
    test_case_n = [test_case_n i];
    test_case_b = [test_case_b 1];

    [t, e] = generate_test_1a(i, round(i/10) - 1);
    times_tot = [times_tot t];
    errors = [errors, e];
    test_case_n = [test_case_n i];
    test_case_b = [test_case_b (round(i/10) - 1)];
    i
  end
end
