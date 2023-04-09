import time
import logging

from smort.src.sys.exitcodes import OK_BUGS, OK_NOBUGS


class Statistic:
    def __init__(self):
        self.start_time = time.time()
        self.total_seeds = 0
        self.invalid_seeds = 0
        self.morphs = 0
        self.invalid_morphs = 0
        self.crashes = 0
        self.soundness = 0
        self.duplicates = 0
        self.timeout = 0
        self.solver_calls = 0
        self.effective_calls = 0

    def printbar(self):
        total_time = time.time() - self.start_time
        if self.solver_calls != 0:
            eff = round(
                (float(self.effective_calls) / float(self.solver_calls)) * 100,
                1
            )
            eff_str = f"{eff}%"
        else:
            eff_str = "NaN"

        solver_calls_per_sec = round(
            float(self.solver_calls) / float(total_time), 1)

        morphs_per_sec = round(float(self.morphs) / float(total_time), 1)

        bar = f"Performed {self.solver_calls} solver calls \
({solver_calls_per_sec} calls/s, eff: {eff_str}, {morphs_per_sec} morphs/s)"
        logging.info(bar)

    def printsummary(self):
        valid_seeds = self.total_seeds - self.invalid_seeds
        num_bugs = self.crashes + self.soundness
        summary = f"\b\b{self.total_seeds} seeds groups processed, \
{valid_seeds} valid, {self.invalid_seeds} invalid \n{num_bugs} bug triggers found"
        print(summary)

    def check_bugs(self):
        if self.crashes + self.soundness == 0:
            exit(OK_NOBUGS)
        exit(OK_BUGS)