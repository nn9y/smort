import logging

from smort.src.sys.exitcodes import ERR_EXHAUSTED_DISK
from smort.src.tools.utils import plain, escape, random_string, list2str


def report_bug(script, folder, bugtype, cmd, seeds, stdout, stderr):
    plain_cmd = plain(cmd)
    # bug filename format:
    # <{crash, wrong, invalid_model}><solver_cmd><seeds>.<random-str>.<{smt2, record}>
    fn_format = "%s/%s-%s-%s-%s" % (
        folder,
        bugtype, 
        plain_cmd,
        escape(list2str(seeds, separator='-')),
        random_string(),
    )

    report = fn_format + ".smt2"
    try:
        with open(report, "w") as report_writer:
            report_writer.write(script.__str__())
    except Exception:
        logging.error("couldn't copy testfile to bugfolder.") 
        exit(ERR_EXHAUSTED_DISK)

    record = fn_format + ".record"
    try:
        with open(record, "w") as record_writer:
            record_writer.write(f"command: {cmd}\nstderr:\n{stderr}stdout:\n{stdout}")
    except Exception:
        logging.error("couldn't save recordfile to bugfolder.") 
        exit(ERR_EXHAUSTED_DISK)

    return report
