#
# In-place makefile for use side-by-side with the
# CMake build system
#

DDM_ROOT=.
#include $(DDM_ROOT)/make.defs

STATIC_CONFIG_H    = $(DDM_ROOT)/include/ddm/util/StaticConfig.h
STATIC_CONFIG_H_IN = $(DDM_ROOT)/include/ddm/util/StaticConfig.h.in


CXXFLAGS+=-I$(DART_INC) -I$(DDM_INC)

ifeq ($(DDM_ENABLE_LOGGING),1)
    CXXFLAGS+=-DDDM_ENABLE_LOGGING
endif

ifeq ($(DDM_ENABLE_TRACE_LOGGING),1)
    CXXFLAGS+=-DDDM_ENABLE_LOGGING
    CXXFLAGS+=-DDDM_ENABLE_TRACE_LOGGING
endif

ifeq ($(DDM_ENABLE_ASSERTIONS),1)
    CXXFLAGS+=-DDDM_ENABLE_ASSERTIONS
endif

CXXFLAGS+=-DDDM_ENABLE_DEFAULT_INDEX_TYPE_LONG
CXXFLAGS+=-std=c++11

#CXXFLAGS+=-DDDM_DEBUG
#CFLAGS+=-D_SVID_SOURCE

LIBDDM = libddm.a

FILES = Distribution GlobPtr Init Logging Math Team             \
    algorithm/SUMMA exception/StackTrace util/BenchmarkParams    \
    util/Config util/Locality util/LocalityDomain            \
    util/LocalityJSONPrinter util/TeamLocality util/Timer        \
    util/TimestampClockPosix util/TimestampCounterPosix        \
    util/TimestampPAPI util/Trace

OBJS = $(addsuffix .o, $(FILES))

all : $(LIBDDM)

$(LIBDDM) : $(STATIC_CONFIG_H) $(OBJS)
    ar rcs $(LIBDDM) $(OBJS)


$(STATIC_CONFIG_H) : $(STATIC_CONFIG_H_IN)
    cat $(STATIC_CONFIG_H_IN)                 | \
    sed "s/@CONF_AVAIL_PAPI@/false/"          | \
    sed "s/@CONF_AVAIL_HWLOC@/false/"         | \
    sed "s/@CONF_AVAIL_LIKWID@/false/"        | \
    sed "s/@CONF_AVAIL_NUMA@/false/"          | \
    sed "s/@CONF_AVAIL_PLASMA@/false/"        | \
    sed "s/@CONF_AVAIL_HDF5@/false/"          | \
    sed "s/@CONF_AVAIL_MKL@/false/"           | \
    sed "s/@CONF_AVAIL_BLAS@/false/"          | \
    sed "s/@CONF_AVAIL_LAPACK@/false/"        | \
    sed "s/@CONF_AVAIL_ALGO_SUMMA@/false/"    | \
    sed "s/@CONF_AVAIL_SCALAPACK@/false/"  > $(STATIC_CONFIG_H)


clean :
    rm -f *~
    rm -f *.o
    rm -f util/*.o algorithm/*.o
    rm -f $(LIBDDM)
    rm -f $(STATIC_CONFIG_H)


printenv :
    @echo "DART_IMPL   = $(DART_IMPL)"
    @echo "DART_IF     = $(DART_IF)"
    @echo "DDM_ROOT   = $(DDM_ROOT)"
    @echo "LIBDART_DIR = $(LIBDART_DIR)"
    @echo "LIBDART     = $(LIBDART)"
    @echo "DART_INC    = $(DART_INC)"
    @echo "CXX         = $(CXX)"
    @echo "CXXFLAGS    = $(CXXFLAGS)"
