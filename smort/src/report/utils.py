from smort.src.tools.utils import plain, escape, random_string


def report_bug(script, bugtype, cli, stdout, stderr):
    plain_cli = plain(cli)
    # bug filename format:
    # <{crash, wrong, invalid_model}><solver_cli><seeds>.<random-str>.<{smt2, record}>
    fn_format = "%s/%s-%s-%s-%s" % (
        self.args.bugfolder,
        bugtype, 
        plain_cli,
        escape(list2str(self.currentseeds, separator='-')),
        random_string(),
    )

    report = fn_format + ".smt2"
    try:
        with open(report, "w") as report_writer:
            report_writer.write(script.__str__())
    except Exception:
        logging.error("error: couldn't copy scratchfile to bugfolder.") 
        exit(ERR_EXHAUSTED_DISK)

    record = fn_format + ".record"
    try:
        with open(record, "w") as record_writer:
            record_writer.write(f"command: {cli}\nstderr:\n{stderr}stdout:\n{stdout}")
    except Exception:
        logging.error("error: couldn't save recordfile to bugfolder.") 
        exit(ERR_EXHAUSTED_DISK)

    return report