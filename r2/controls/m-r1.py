import sys
p=sys.argv[1]; s=open(p).read()
a="""        let KObjectRef::Paged(holder) = data.handles.get_ref(h, Rights::NONE)? else {
            return Ok(Err(SyscallError::InvalidArgument));
        };
        let holder = Arc::clone(holder);"""
b="""        let holder = data.handles.get::<crate::object::paged::PagedHolderObject>(h, Rights::READ)?;"""
assert a in s; open(p,'w').write(s.replace(a,b,1))
