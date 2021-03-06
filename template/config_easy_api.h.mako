## -*- coding: utf-8 -*-
<%!
import time
%>
//
// generated by xrescode on ${time.strftime("%Y-%m-%d %H:%M:%S")}, please don't edit it
//

#pragma once

#include "config_manager.h"

namespace excel {
% for pb_msg in pb_set.generate_message:
%   for loader in pb_msg.loaders:
    // ======================================== ${loader.code.class_name} ========================================
%     for code_index in loader.code.indexes:
    const ${loader.get_cpp_class_full_name()}::${code_index.name}_container_type& get_${loader.code.class_name}_all_of_${code_index.name}();
%       if code_index.is_list():
    const ${loader.get_cpp_class_full_name()}::${code_index.name}_value_type* get_${loader.code.class_name}_by_${code_index.name}(${code_index.get_key_decl()});
    ${loader.get_cpp_class_full_name()}::item_ptr_type get_${loader.code.class_name}_by_${code_index.name}(${code_index.get_key_decl()}, size_t idx);
%       else:
    ${loader.get_cpp_class_full_name()}::${code_index.name}_value_type get_${loader.code.class_name}_by_${code_index.name}(${code_index.get_key_decl()});
%       endif
%     endfor
%   endfor
% endfor
}
