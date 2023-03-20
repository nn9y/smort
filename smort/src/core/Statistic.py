import time
import logging


class Statistic:
    def __init__(self):
        self.start_time = time.time()
        self.total_seeds = 0
        self.invalid_seeds = 0
        self.total_generations = 0
        self.unsuccessful_generations = 0
        self.mutants = 0
        self.invalid_mutants = 0
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

        mutants_per_sec = round(float(self.mutants) / float(total_time), 1)

        bar = f"Performed {self.solver_calls} solver calls \
({solver_calls_per_sec} calls/s, eff: {eff_str}, {mutants_per_sec} mutants/s)"
        logging.info(bar)

    def printsum(self):
        valid_seeds = self.total_seeds - self.invalid_seeds
        num_bugs = self.crashes + self.soundness
        summary = f"\b\b{self.total_seeds} seeds processed, \
{valid_seeds} valid, {self.invalid_seeds} invalid \n{num_bugs} bug triggers found"
        print(summary)
