include "config.pxi"
from api_types_hdf5 cimport *
from api_types_ext cimport *

cdef extern from "hdf5.h":
  herr_t H5open()
  herr_t H5close()
  herr_t H5get_libversion(unsigned *majnum, unsigned *minnum, unsigned *relnum)
  hid_t H5Dcreate(hid_t loc, char* name, hid_t type_id, hid_t space_id,hid_t create_plist_id)
  hid_t H5Dopen(hid_t file_id, char *name)
  herr_t H5Dclose(hid_t dset_id)
  hid_t H5Dget_space(hid_t dset_id)
  herr_t H5Dget_space_status(hid_t dset_id, H5D_space_status_t *status)
  hid_t H5Dget_type(hid_t dset_id)
  hid_t H5Dget_create_plist(hid_t dataset_id)
  haddr_t H5Dget_offset(hid_t dset_id)
  hsize_t H5Dget_storage_size(hid_t dset_id)
  herr_t H5Dread(hid_t dset_id, hid_t mem_type_id, hid_t mem_space_id, hid_t file_space_id, hid_t plist_id, void *buf)
  herr_t H5Dwrite(hid_t dset_id, hid_t mem_type, hid_t mem_space, hid_t file_space, hid_t xfer_plist, void* buf)
  herr_t H5Dextend(hid_t dataset_id, hsize_t *size)
  herr_t H5Dfill(void *fill, hid_t fill_type_id, void *buf,  hid_t buf_type_id, hid_t space_id )
  herr_t H5Dvlen_get_buf_size(hid_t dset_id, hid_t type_id, hid_t space_id, hsize_t *size)
  herr_t H5Dvlen_reclaim(hid_t type_id, hid_t space_id,  hid_t plist, void *buf)
  herr_t H5Diterate(void *buf, hid_t type_id, hid_t space_id,  H5D_operator_t op, void* operator_data)
  herr_t H5Dset_extent(hid_t dset_id, hsize_t* size)
  IF H5PY_18API:
    hid_t H5Dcreate2(hid_t loc_id, char *name, hid_t type_id, hid_t space_id, hid_t lcpl_id, hid_t dcpl_id, hid_t dapl_id)
    
  IF H5PY_18API:
    hid_t H5Dcreate_anon(hid_t file_id, hid_t type_id, hid_t space_id, hid_t plist_id, hid_t dapl_id)
    
  hid_t H5Fcreate(char *filename, unsigned int flags, hid_t create_plist, hid_t access_plist)
  hid_t H5Fopen(char *name, unsigned flags, hid_t access_id)
  herr_t H5Fclose(hid_t file_id)
  htri_t H5Fis_hdf5(char *name)
  herr_t H5Fflush(hid_t object_id, H5F_scope_t scope)
  hid_t H5Freopen(hid_t file_id)
  herr_t H5Fmount(hid_t loc_id, char *name, hid_t child_id, hid_t plist_id)
  herr_t H5Funmount(hid_t loc_id, char *name)
  herr_t H5Fget_filesize(hid_t file_id, hsize_t *size)
  hid_t H5Fget_create_plist(hid_t file_id )
  hid_t H5Fget_access_plist(hid_t file_id)
  hssize_t H5Fget_freespace(hid_t file_id)
  ssize_t H5Fget_name(hid_t obj_id, char *name, size_t size)
  int H5Fget_obj_count(hid_t file_id, unsigned int types)
  int H5Fget_obj_ids(hid_t file_id, unsigned int types, int max_objs, hid_t *obj_id_list)
  IF H5PY_18API:
    herr_t H5Fget_intent(hid_t file_id, unsigned int *intent)
    
  hid_t H5Gcreate(hid_t loc_id, char *name, size_t size_hint)
  hid_t H5Gopen(hid_t loc_id, char *name)
  herr_t H5Gclose(hid_t group_id)
  herr_t H5Glink2( hid_t curr_loc_id, char *current_name, H5G_link_t link_type, hid_t new_loc_id, char *new_name)
  herr_t H5Gunlink(hid_t file_id, char *name)
  herr_t H5Gmove2(hid_t src_loc_id, char *src_name, hid_t dst_loc_id, char *dst_name)
  herr_t H5Gget_num_objs(hid_t loc_id, hsize_t*  num_obj)
  int H5Gget_objname_by_idx(hid_t loc_id, hsize_t idx, char *name, size_t size)
  int H5Gget_objtype_by_idx(hid_t loc_id, hsize_t idx)
  herr_t H5Giterate(hid_t loc_id, char *name, int *idx, H5G_iterate_t op, void* data)
  herr_t H5Gget_objinfo(hid_t loc_id, char* name, int follow_link, H5G_stat_t *statbuf)
  herr_t H5Gget_linkval(hid_t loc_id, char *name, size_t size, char *value)
  herr_t H5Gset_comment(hid_t loc_id, char *name, char *comment)
  int H5Gget_comment(hid_t loc_id, char *name, size_t bufsize, char *comment)
  IF H5PY_18API:
    hid_t H5Gcreate_anon( hid_t loc_id, hid_t gcpl_id, hid_t gapl_id)
    
  IF H5PY_18API:
    hid_t H5Gcreate2(hid_t loc_id, char *name, hid_t lcpl_id, hid_t gcpl_id, hid_t gapl_id)
    
  IF H5PY_18API:
    hid_t H5Gopen2( hid_t loc_id, char * name, hid_t gapl_id)
    
  IF H5PY_18API:
    herr_t H5Gget_info( hid_t group_id, H5G_info_t *group_info)
    
  IF H5PY_18API:
    herr_t H5Gget_info_by_name( hid_t loc_id, char *group_name, H5G_info_t *group_info, hid_t lapl_id)
    
  IF H5PY_18API:
    hid_t H5Gget_create_plist(hid_t group_id)
    
  H5I_type_t H5Iget_type(hid_t obj_id)
  ssize_t H5Iget_name( hid_t obj_id, char *name, size_t size)
  hid_t H5Iget_file_id(hid_t obj_id)
  int H5Idec_ref(hid_t obj_id)
  int H5Iget_ref(hid_t obj_id)
  int H5Iinc_ref(hid_t obj_id)
  IF H5PY_18API:
    herr_t H5Lmove(hid_t src_loc, char *src_name, hid_t dst_loc, char *dst_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lcopy(hid_t src_loc, char *src_name, hid_t dst_loc, char *dst_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lcreate_hard(hid_t cur_loc, char *cur_name, hid_t dst_loc, char *dst_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lcreate_soft(char *link_target, hid_t link_loc_id, char *link_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Ldelete(hid_t loc_id, char *name, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Ldelete_by_idx(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lget_val(hid_t loc_id, char *name, void *bufout, size_t size, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lget_val_by_idx(hid_t loc_id, char *group_name,  H5_index_t idx_type, H5_iter_order_t order, hsize_t n, void *bufout, size_t size, hid_t lapl_id)
    
  IF H5PY_18API:
    htri_t H5Lexists(hid_t loc_id, char *name, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lget_info(hid_t loc_id, char *name, H5L_info_t *linfo, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lget_info_by_idx(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, H5L_info_t *linfo, hid_t lapl_id)
    
  IF H5PY_18API:
    ssize_t H5Lget_name_by_idx(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, char *name, size_t size, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Literate(hid_t grp_id, H5_index_t idx_type, H5_iter_order_t order, hsize_t *idx, H5L_iterate_t op, void *op_data)
    
  IF H5PY_18API:
    herr_t H5Literate_by_name(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t *idx, H5L_iterate_t op, void *op_data, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lvisit(hid_t grp_id, H5_index_t idx_type, H5_iter_order_t order, H5L_iterate_t op, void *op_data)
    
  IF H5PY_18API:
    herr_t H5Lvisit_by_name(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, H5L_iterate_t op, void *op_data, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Lunpack_elink_val(void *ext_linkval, size_t link_size, unsigned *flags, char **filename, char **obj_path)
    
  IF H5PY_18API:
    herr_t H5Lcreate_external(char *file_name, char *obj_name, hid_t link_loc_id, char *link_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    hid_t H5Oopen(hid_t loc_id, char *name, hid_t lapl_id)
    
  IF H5PY_18API:
    hid_t H5Oopen_by_addr(hid_t loc_id, haddr_t addr)
    
  IF H5PY_18API:
    hid_t H5Oopen_by_idx(hid_t loc_id, char *group_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Oget_info(hid_t loc_id, H5O_info_t *oinfo)
    
  IF H5PY_18API:
    herr_t H5Oget_info_by_name(hid_t loc_id, char *name, H5O_info_t *oinfo, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Oget_info_by_idx(hid_t loc_id, char *group_name,  H5_index_t idx_type, H5_iter_order_t order, hsize_t n, H5O_info_t *oinfo, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Olink(hid_t obj_id, hid_t new_loc_id, char *new_name, hid_t lcpl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Ocopy(hid_t src_loc_id, char *src_name, hid_t dst_loc_id,  char *dst_name, hid_t ocpypl_id, hid_t lcpl_id)
    
  IF H5PY_18API:
    herr_t H5Oincr_refcount(hid_t object_id)
    
  IF H5PY_18API:
    herr_t H5Odecr_refcount(hid_t object_id)
    
  IF H5PY_18API:
    herr_t H5Oset_comment(hid_t obj_id, char *comment)
    
  IF H5PY_18API:
    herr_t H5Oset_comment_by_name(hid_t loc_id, char *name,  char *comment, hid_t lapl_id)
    
  IF H5PY_18API:
    ssize_t H5Oget_comment(hid_t obj_id, char *comment, size_t bufsize)
    
  IF H5PY_18API:
    ssize_t H5Oget_comment_by_name(hid_t loc_id, char *name, char *comment, size_t bufsize, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Ovisit(hid_t obj_id, H5_index_t idx_type, H5_iter_order_t order,  H5O_iterate_t op, void *op_data)
    
  IF H5PY_18API:
    herr_t H5Ovisit_by_name(hid_t loc_id, char *obj_name, H5_index_t idx_type, H5_iter_order_t order, H5O_iterate_t op, void *op_data, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Oclose(hid_t object_id)
    
  hid_t H5Pcreate(hid_t plist_id)
  hid_t H5Pcopy(hid_t plist_id)
  int H5Pget_class(hid_t plist_id)
  herr_t H5Pclose(hid_t plist_id)
  htri_t H5Pequal( hid_t id1, hid_t id2 )
  herr_t H5Pclose_class(hid_t id)
  herr_t H5Pget_version(hid_t plist, unsigned int *super_, unsigned int* freelist,  unsigned int *stab, unsigned int *shhdr)
  herr_t H5Pset_userblock(hid_t plist, hsize_t size)
  herr_t H5Pget_userblock(hid_t plist, hsize_t * size)
  herr_t H5Pset_sizes(hid_t plist, size_t sizeof_addr, size_t sizeof_size)
  herr_t H5Pget_sizes(hid_t plist, size_t *sizeof_addr, size_t *sizeof_size)
  herr_t H5Pset_sym_k(hid_t plist, unsigned int ik, unsigned int lk)
  herr_t H5Pget_sym_k(hid_t plist, unsigned int *ik, unsigned int *lk)
  herr_t H5Pset_istore_k(hid_t plist, unsigned int ik)
  herr_t H5Pget_istore_k(hid_t plist, unsigned int *ik)
  herr_t H5Pset_fclose_degree(hid_t fapl_id, H5F_close_degree_t fc_degree)
  herr_t H5Pget_fclose_degree(hid_t fapl_id, H5F_close_degree_t *fc_degree)
  herr_t H5Pset_fapl_core( hid_t fapl_id, size_t increment, hbool_t backing_store)
  herr_t H5Pget_fapl_core( hid_t fapl_id, size_t *increment, hbool_t *backing_store)
  herr_t H5Pset_fapl_family( hid_t fapl_id,  hsize_t memb_size, hid_t memb_fapl_id )
  herr_t H5Pget_fapl_family( hid_t fapl_id, hsize_t *memb_size, hid_t *memb_fapl_id )
  herr_t H5Pset_family_offset( hid_t fapl_id, hsize_t offset)
  herr_t H5Pget_family_offset( hid_t fapl_id, hsize_t *offset)
  herr_t H5Pset_fapl_log(hid_t fapl_id, char *logfile, unsigned int flags, size_t buf_size)
  herr_t H5Pset_fapl_multi(hid_t fapl_id, H5FD_mem_t *memb_map, hid_t *memb_fapl, char **memb_name, haddr_t *memb_addr, hbool_t relax)
  herr_t H5Pset_cache(hid_t plist_id, int mdc_nelmts, int rdcc_nelmts,  size_t rdcc_nbytes, double rdcc_w0)
  herr_t H5Pget_cache(hid_t plist_id, int *mdc_nelmts, int *rdcc_nelmts, size_t *rdcc_nbytes, double *rdcc_w0)
  herr_t H5Pset_fapl_sec2(hid_t fapl_id)
  herr_t H5Pset_fapl_stdio(hid_t fapl_id)
  hid_t H5Pget_driver(hid_t fapl_id)
  herr_t H5Pset_layout(hid_t plist, int layout)
  H5D_layout_t H5Pget_layout(hid_t plist)
  herr_t H5Pset_chunk(hid_t plist, int ndims, hsize_t * dim)
  int H5Pget_chunk(hid_t plist, int max_ndims, hsize_t * dims )
  herr_t H5Pset_deflate( hid_t plist, int level)
  herr_t H5Pset_fill_value(hid_t plist_id, hid_t type_id, void *value )
  herr_t H5Pget_fill_value(hid_t plist_id, hid_t type_id, void *value )
  herr_t H5Pfill_value_defined(hid_t plist_id, H5D_fill_value_t *status )
  herr_t H5Pset_fill_time(hid_t plist_id, H5D_fill_time_t fill_time )
  herr_t H5Pget_fill_time(hid_t plist_id, H5D_fill_time_t *fill_time )
  herr_t H5Pset_alloc_time(hid_t plist_id, H5D_alloc_time_t alloc_time )
  herr_t H5Pget_alloc_time(hid_t plist_id, H5D_alloc_time_t *alloc_time )
  herr_t H5Pset_filter(hid_t plist, H5Z_filter_t filter, unsigned int flags, size_t cd_nelmts, unsigned int* cd_values )
  htri_t H5Pall_filters_avail(hid_t dcpl_id)
  int H5Pget_nfilters(hid_t plist)
  H5Z_filter_t H5Pget_filter(hid_t plist, unsigned int filter_number,   unsigned int *flags, size_t *cd_nelmts,  unsigned int* cd_values, size_t namelen, char* name )
  herr_t H5Pget_filter_by_id( hid_t plist_id, H5Z_filter_t filter,  unsigned int *flags, size_t *cd_nelmts,  unsigned int* cd_values, size_t namelen, char* name)
  herr_t H5Pmodify_filter(hid_t plist, H5Z_filter_t filter, unsigned int flags, size_t cd_nelmts, unsigned int *cd_values)
  herr_t H5Premove_filter(hid_t plist, H5Z_filter_t filter )
  herr_t H5Pset_fletcher32(hid_t plist)
  herr_t H5Pset_shuffle(hid_t plist_id)
  herr_t H5Pset_szip(hid_t plist, unsigned int options_mask, unsigned int pixels_per_block)
  herr_t H5Pset_edc_check(hid_t plist, H5Z_EDC_t check)
  H5Z_EDC_t H5Pget_edc_check(hid_t plist)
  herr_t H5Pset_sieve_buf_size(hid_t fapl_id, size_t size)
  herr_t H5Pget_sieve_buf_size(hid_t fapl_id, size_t *size)
  IF H5PY_18API:
    herr_t H5Pset_nlinks(hid_t plist_id, size_t nlinks)
    
  IF H5PY_18API:
    herr_t H5Pget_nlinks(hid_t plist_id, size_t *nlinks)
    
  IF H5PY_18API:
    herr_t H5Pset_elink_prefix(hid_t plist_id, char *prefix)
    
  IF H5PY_18API:
    ssize_t H5Pget_elink_prefix(hid_t plist_id, char *prefix, size_t size)
    
  IF H5PY_18API:
    hid_t H5Pget_elink_fapl(hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Pset_elink_fapl(hid_t lapl_id, hid_t fapl_id)
    
  IF H5PY_18API:
    herr_t H5Pset_create_intermediate_group(hid_t plist_id, unsigned crt_intmd)
    
  IF H5PY_18API:
    herr_t H5Pget_create_intermediate_group(hid_t plist_id, unsigned *crt_intmd)
    
  IF H5PY_18API:
    herr_t H5Pset_copy_object(hid_t plist_id, unsigned crt_intmd)
    
  IF H5PY_18API:
    herr_t H5Pget_copy_object(hid_t plist_id, unsigned *crt_intmd)
    
  IF H5PY_18API:
    herr_t H5Pset_char_encoding(hid_t plist_id, H5T_cset_t encoding)
    
  IF H5PY_18API:
    herr_t H5Pget_char_encoding(hid_t plist_id, H5T_cset_t *encoding)
    
  IF H5PY_18API:
    herr_t H5Pset_local_heap_size_hint(hid_t plist_id, size_t size_hint)
    
  IF H5PY_18API:
    herr_t H5Pget_local_heap_size_hint(hid_t plist_id, size_t *size_hint)
    
  IF H5PY_18API:
    herr_t H5Pset_link_phase_change(hid_t plist_id, unsigned max_compact, unsigned min_dense)
    
  IF H5PY_18API:
    herr_t H5Pget_link_phase_change(hid_t plist_id, unsigned *max_compact , unsigned *min_dense)
    
  IF H5PY_18API:
    herr_t H5Pset_est_link_info(hid_t plist_id, unsigned est_num_entries, unsigned est_name_len)
    
  IF H5PY_18API:
    herr_t H5Pget_est_link_info(hid_t plist_id, unsigned *est_num_entries , unsigned *est_name_len)
    
  IF H5PY_18API:
    herr_t H5Pset_link_creation_order(hid_t plist_id, unsigned crt_order_flags)
    
  IF H5PY_18API:
    herr_t H5Pget_link_creation_order(hid_t plist_id, unsigned *crt_order_flags)
    
  herr_t H5Rcreate(void *ref, hid_t loc_id, char *name, H5R_type_t ref_type,  hid_t space_id)
  hid_t H5Rdereference(hid_t obj_id, H5R_type_t ref_type, void *ref)
  hid_t H5Rget_region(hid_t dataset, H5R_type_t ref_type, void *ref)
  H5G_obj_t H5Rget_obj_type(hid_t id, H5R_type_t ref_type, void *ref)
  IF H5PY_18API:
    ssize_t H5Rget_name(hid_t loc_id, H5R_type_t ref_type, void *ref, char *name, size_t size)
    
  hid_t H5Screate(H5S_class_t type)
  hid_t H5Scopy(hid_t space_id )
  herr_t H5Sclose(hid_t space_id)
  hid_t H5Screate_simple(int rank, hsize_t *dims, hsize_t *maxdims)
  htri_t H5Sis_simple(hid_t space_id)
  herr_t H5Soffset_simple(hid_t space_id, hssize_t *offset )
  int H5Sget_simple_extent_ndims(hid_t space_id)
  int H5Sget_simple_extent_dims(hid_t space_id, hsize_t *dims, hsize_t *maxdims)
  hssize_t H5Sget_simple_extent_npoints(hid_t space_id)
  H5S_class_t H5Sget_simple_extent_type(hid_t space_id)
  herr_t H5Sextent_copy(hid_t dest_space_id, hid_t source_space_id )
  herr_t H5Sset_extent_simple(hid_t space_id, int rank, hsize_t *current_size, hsize_t *maximum_size )
  herr_t H5Sset_extent_none(hid_t space_id)
  H5S_sel_type H5Sget_select_type(hid_t space_id)
  hssize_t H5Sget_select_npoints(hid_t space_id)
  herr_t H5Sget_select_bounds(hid_t space_id, hsize_t *start, hsize_t *end)
  herr_t H5Sselect_all(hid_t space_id)
  herr_t H5Sselect_none(hid_t space_id)
  htri_t H5Sselect_valid(hid_t space_id)
  hssize_t H5Sget_select_elem_npoints(hid_t space_id)
  herr_t H5Sget_select_elem_pointlist(hid_t space_id, hsize_t startpoint,  hsize_t numpoints, hsize_t *buf)
  herr_t H5Sselect_elements(hid_t space_id, H5S_seloper_t op,  size_t num_elements, hsize_t **coord)
  hssize_t H5Sget_select_hyper_nblocks(hid_t space_id )
  herr_t H5Sget_select_hyper_blocklist(hid_t space_id,  hsize_t startblock, hsize_t numblocks, hsize_t *buf )
  herr_t H5Sselect_hyperslab(hid_t space_id, H5S_seloper_t op,  hsize_t *start, hsize_t *_stride, hsize_t *count, hsize_t *_block)
  IF H5PY_18API:
    herr_t H5Sencode(hid_t obj_id, void *buf, size_t *nalloc)
    
  IF H5PY_18API:
    hid_t H5Sdecode(void *buf)
    
  hid_t H5Tcreate(H5T_class_t type, size_t size)
  hid_t H5Topen(hid_t loc, char* name)
  herr_t H5Tcommit(hid_t loc_id, char* name, hid_t type)
  htri_t H5Tcommitted(hid_t type)
  hid_t H5Tcopy(hid_t type_id)
  htri_t H5Tequal(hid_t type_id1, hid_t type_id2 )
  herr_t H5Tlock(hid_t type_id)
  H5T_class_t H5Tget_class(hid_t type_id)
  size_t H5Tget_size(hid_t type_id)
  hid_t H5Tget_super(hid_t type)
  htri_t H5Tdetect_class(hid_t type_id, H5T_class_t dtype_class)
  herr_t H5Tclose(hid_t type_id)
  hid_t H5Tget_native_type(hid_t type_id, H5T_direction_t direction)
  herr_t H5Tconvert(hid_t src_id, hid_t dst_id, size_t nelmts, void *buf, void *background, hid_t plist_id)
  herr_t H5Tset_size(hid_t type_id, size_t size)
  H5T_order_t H5Tget_order(hid_t type_id)
  herr_t H5Tset_order(hid_t type_id, H5T_order_t order)
  hsize_t H5Tget_precision(hid_t type_id)
  herr_t H5Tset_precision(hid_t type_id, size_t prec)
  int H5Tget_offset(hid_t type_id)
  herr_t H5Tset_offset(hid_t type_id, size_t offset)
  herr_t H5Tget_pad(hid_t type_id, H5T_pad_t * lsb, H5T_pad_t * msb )
  herr_t H5Tset_pad(hid_t type_id, H5T_pad_t lsb, H5T_pad_t msb )
  H5T_sign_t H5Tget_sign(hid_t type_id)
  herr_t H5Tset_sign(hid_t type_id, H5T_sign_t sign)
  herr_t H5Tget_fields(hid_t type_id, size_t *spos, size_t *epos, size_t *esize, size_t *mpos, size_t *msize )
  herr_t H5Tset_fields(hid_t type_id, size_t spos, size_t epos, size_t esize, size_t mpos, size_t msize )
  size_t H5Tget_ebias(hid_t type_id)
  herr_t H5Tset_ebias(hid_t type_id, size_t ebias)
  H5T_norm_t H5Tget_norm(hid_t type_id)
  herr_t H5Tset_norm(hid_t type_id, H5T_norm_t norm)
  H5T_pad_t H5Tget_inpad(hid_t type_id)
  herr_t H5Tset_inpad(hid_t type_id, H5T_pad_t inpad)
  H5T_cset_t H5Tget_cset(hid_t type_id)
  herr_t H5Tset_cset(hid_t type_id, H5T_cset_t cset)
  H5T_str_t H5Tget_strpad(hid_t type_id)
  herr_t H5Tset_strpad(hid_t type_id, H5T_str_t strpad)
  hid_t H5Tvlen_create(hid_t base_type_id)
  htri_t H5Tis_variable_str(hid_t dtype_id)
  int H5Tget_nmembers(hid_t type_id)
  H5T_class_t H5Tget_member_class(hid_t type_id, int member_no)
  char* H5Tget_member_name(hid_t type_id, unsigned membno)
  hid_t H5Tget_member_type(hid_t type_id, unsigned membno)
  int H5Tget_member_offset(hid_t type_id, int membno)
  int H5Tget_member_index(hid_t type_id, char* name)
  herr_t H5Tinsert(hid_t parent_id, char *name, size_t offset, hid_t member_id)
  herr_t H5Tpack(hid_t type_id)
  hid_t H5Tenum_create(hid_t base_id)
  herr_t H5Tenum_insert(hid_t type, char *name, void *value)
  herr_t H5Tenum_nameof( hid_t type, void *value, char *name, size_t size )
  herr_t H5Tenum_valueof( hid_t type, char *name, void *value )
  herr_t H5Tget_member_value(hid_t type,  unsigned int memb_no, void *value )
  hid_t H5Tarray_create(hid_t base_id, int ndims, hsize_t *dims, int *perm)
  int H5Tget_array_ndims(hid_t type_id)
  int H5Tget_array_dims(hid_t type_id, hsize_t *dims, int *perm)
  herr_t H5Tset_tag(hid_t type_id, char* tag)
  char* H5Tget_tag(hid_t type_id)
  IF H5PY_18API:
    hid_t H5Tdecode(unsigned char *buf)
    
  IF H5PY_18API:
    herr_t H5Tencode(hid_t obj_id, unsigned char *buf, size_t *nalloc)
    
  IF H5PY_18API:
    herr_t H5Tcommit2(hid_t loc_id, char *name, hid_t dtype_id, hid_t lcpl_id, hid_t tcpl_id, hid_t tapl_id)
    
  H5T_conv_t H5Tfind(hid_t src_id, hid_t dst_id, H5T_cdata_t **pcdata)
  herr_t H5Tregister(H5T_pers_t pers, char *name, hid_t src_id, hid_t dst_id, H5T_conv_t func)
  herr_t H5Tunregister(H5T_pers_t pers, char *name, hid_t src_id, hid_t dst_id, H5T_conv_t func)
  htri_t H5Zfilter_avail(H5Z_filter_t id_)
  herr_t H5Zget_filter_info(H5Z_filter_t filter_, unsigned int *filter_config_flags)
  hid_t H5Acreate(hid_t loc_id, char *name, hid_t type_id, hid_t space_id, hid_t create_plist)
  hid_t H5Aopen_idx(hid_t loc_id, unsigned int idx)
  hid_t H5Aopen_name(hid_t loc_id, char *name)
  herr_t H5Aclose(hid_t attr_id)
  herr_t H5Adelete(hid_t loc_id, char *name)
  herr_t H5Aread(hid_t attr_id, hid_t mem_type_id, void *buf)
  herr_t H5Awrite(hid_t attr_id, hid_t mem_type_id, void *buf )
  int H5Aget_num_attrs(hid_t loc_id)
  ssize_t H5Aget_name(hid_t attr_id, size_t buf_size, char *buf)
  hid_t H5Aget_space(hid_t attr_id)
  hid_t H5Aget_type(hid_t attr_id)
  herr_t H5Aiterate(hid_t loc_id, unsigned * idx, H5A_operator_t op, void* op_data)
  IF H5PY_18API:
    herr_t H5Adelete_by_name(hid_t loc_id, char *obj_name, char *attr_name, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Adelete_by_idx(hid_t loc_id, char *obj_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, hid_t lapl_id)
    
  IF H5PY_18API:
    hid_t H5Acreate_by_name(hid_t loc_id, char *obj_name, char *attr_name, hid_t type_id, hid_t space_id, hid_t acpl_id, hid_t aapl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Aopen(hid_t obj_id, char *attr_name, hid_t aapl_id)
    
  IF H5PY_18API:
    herr_t H5Aopen_by_name( hid_t loc_id, char *obj_name, char *attr_name, hid_t aapl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Aopen_by_idx(hid_t loc_id, char *obj_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, hid_t aapl_id, hid_t lapl_id)
    
  IF H5PY_18API:
    htri_t H5Aexists_by_name( hid_t loc_id, char *obj_name, char *attr_name, hid_t lapl_id)
    
  IF H5PY_18API:
    htri_t H5Aexists(hid_t obj_id, char *attr_name)
    
  IF H5PY_18API:
    herr_t H5Arename(hid_t loc_id, char *old_attr_name, char *new_attr_name)
    
  IF H5PY_18API:
    herr_t H5Arename_by_name(hid_t loc_id, char *obj_name, char *old_attr_name, char *new_attr_name, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Aget_info( hid_t attr_id, H5A_info_t *ainfo)
    
  IF H5PY_18API:
    herr_t H5Aget_info_by_name(hid_t loc_id, char *obj_name, char *attr_name, H5A_info_t *ainfo, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Aget_info_by_idx(hid_t loc_id, char *obj_name, H5_index_t idx_type, H5_iter_order_t order, hsize_t n, H5A_info_t *ainfo, hid_t lapl_id)
    
  IF H5PY_18API:
    herr_t H5Aiterate2(hid_t obj_id, H5_index_t idx_type, H5_iter_order_t order, hsize_t *n, H5A_operator2_t op, void *op_data)
    
  IF H5PY_18API:
    hsize_t H5Aget_storage_size(hid_t attr_id)
    