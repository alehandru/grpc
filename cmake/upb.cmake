# Copyright 2019 gRPC authors.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

set(_gRPC_UPB_GRPC_GENERATED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/core/ext/upb-generated" "${CMAKE_CURRENT_SOURCE_DIR}/src/core/ext/upbdefs-generated")
if (gRPC_UPB_PROVIDER STREQUAL "module")

set(UPB_ROOT_DIR ${CMAKE_CURRENT_SOURCE_DIR}/third_party/upb)

set(_gRPC_UPB_INCLUDE_DIR "${UPB_ROOT_DIR}")
set(_gRPC_UPB_GRPC_GENERATED_DIR "${CMAKE_CURRENT_SOURCE_DIR}/src/core/ext/upb-generated" "${CMAKE_CURRENT_SOURCE_DIR}/src/core/ext/upbdefs-generated")

set(_gRPC_UPB_LIBRARIES upb)

elseif(gRPC_UPB_PROVIDER STREQUAL "package")
    find_package(upb CONFIG REQUIRED)
    set(_gRPC_UPB_LIBRARIES upb::fastdecode upb::json upb::upb upb::utf8_range upb::textformat upb::reflection upb::descriptor_upb_proto)
    set(_gRPC_UPB_INCLUDE_DIR)
    set(_gRPC_FIND_UPB "if(NOT upb_FOUND)\n  find_package(upb CONFIG REQUIRED)\nendif()")
endif()
