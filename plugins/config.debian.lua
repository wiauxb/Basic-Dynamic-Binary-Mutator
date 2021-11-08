s2e = {
    kleeArgs = {
        -- complete each state before switching to the next
        --"--use-dfs-search=true", "--max-time=5.0",

        -- use concolic mode and disable preemptive forking for performance
        "--use-concolic-execution",
        "--enable-speculative-forking=false",

        "--keep-llvm-functions",

        -- don't output final.bc or op_helpers.ll
        "--output-module=false", "--output-source=false",

        "--randomize-fork",
        "--use-non-uniform-random-search",
        --"--weight-type=icnt",
        "--use-batching-search", --"--batch-time=1.0",
        --"--flush-tbs-on-state-switch=false",
        "--state-shared-memory=true",
        --"--use-cex-cache",

        --"--help-hidden",
    }
}

plugins = {
    'BaseInstructions',
    'RawMonitor',
    'ModuleExecutionDetector',
    'FunctionMonitor',
    'FunctionLog',
    'HostFiles',
    'ELFSelector',
    'ExportELF'
}

pluginsConfig = {}

pluginsConfig.RawMonitor = {
    kernelStart = 0xc0000000
}

pluginsConfig.ModuleExecutionDetector = {
    trackAllModules = false,
    configureAllModules = false,
}

pluginsConfig.HostFiles = {
    baseDirs = {
        'qemu',
        'test/benchmark/samples/bin/x86/binrec',
        -- 'test/dhrystone-2.1',
        -- 'test/coreutils-8.23',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/exe',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/all/input',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/test/input',
        -- 'test/spec2006/benchspec/CPU2006/429.mcf/exe',
        -- 'test/spec2006/benchspec/CPU2006/429.mcf/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/456.hmmer/exe',
        -- 'test/spec2006/benchspec/CPU2006/456.hmmer/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/458.sjeng/exe',
        -- 'test/spec2006/benchspec/CPU2006/458.sjeng/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/462.libquantum/exe',
        -- 'test/spec2006/benchspec/CPU2006/462.libquantum/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/exe',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/data/all/input',
        -- 'test/spec2006/benchspec/CPU2006/473.astar/exe',
        -- 'test/spec2006/benchspec/CPU2006/473.astar/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/445.gobmk/exe',
        -- 'test/spec2006/benchspec/CPU2006/445.gobmk/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/400.perlbench/exe',
        -- 'test/spec2006/benchspec/CPU2006/471.omnetpp/exe',
        -- 'test/spec2006/benchspec/CPU2006/403.gcc/exe',
    }
}

pluginsConfig.ExportELF = {
    baseDirs = {
        'test/benchmark/samples/bin/x86/binrec',
        -- 'test/dhrystone-2.1',
        -- 'test/coreutils-8.23',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/exe',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/all/input',
        -- 'test/spec2006/benchspec/CPU2006/401.bzip2/data/test/input',
        -- 'test/spec2006/benchspec/CPU2006/429.mcf/exe',
        -- 'test/spec2006/benchspec/CPU2006/429.mcf/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/456.hmmer/exe',
        -- 'test/spec2006/benchspec/CPU2006/456.hmmer/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/458.sjeng/exe',
        -- 'test/spec2006/benchspec/CPU2006/458.sjeng/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/462.libquantum/exe',
        -- 'test/spec2006/benchspec/CPU2006/462.libquantum/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/exe',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/464.h264ref/data/all/input',
        -- 'test/spec2006/benchspec/CPU2006/473.astar/exe',
        -- 'test/spec2006/benchspec/CPU2006/473.astar/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/445.gobmk/exe',
        -- 'test/spec2006/benchspec/CPU2006/445.gobmk/data/ref/input',
        -- 'test/spec2006/benchspec/CPU2006/400.perlbench/exe',
        -- 'test/spec2006/benchspec/CPU2006/471.omnetpp/exe',
        -- 'test/spec2006/benchspec/CPU2006/403.gcc/exe',
    },
    exportInterval = 1000  -- export every 1000 basic blocks
}

pluginsConfig.FunctionLog = {
    logFile = 'function-log.txt'
}

pluginsConfig.AddrLog = {
    logAll = false,
    logFile = 'addrlog.dat'
}

pluginsConfig.RegisterLog = {
    logFile = 'register-log.txt'
}

pluginsConfig.TranslationBlockTracer = {
    manualTrigger = false,
    flushTbCache = false,
}

pluginsConfig.TestCaseLog = {
    logFile = "testcases.txt",
    onlyPrintable = true,
}