function [times_tot, errors, test_case_n, real_res] = tester_a1(start_p, step_p, end_p)
  times_tot = [];
  errors = [];
  test_case_n = [];
  for i=start_p:step_p:end_p
    i
    [t, e, rs] = generate_test_1a(i, round(i/2) - 1);
    times_tot = [times_tot t];
    errors = [errors, e];
    test_case_n = [test_case_n i];
    real_res = [real_res rs]
  end
end
