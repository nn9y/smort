
def raise_runtime_error(trace, argv, e):
    print(f"Runtime error at {trace[-1].filename}:{trace[-1].lineno}", flush=True)
    print("msg: " + str(e), flush=True)
    print(
        "cmd: "
        + " ".join(argv[:-2])
        + " "
        + '"' + argv[-2]
        + '"' + " " + argv[-1],
        flush=True,
    )
