# Metal runs of #926 at `c3f4e070f`

Run by the orchestrator from the requests in `../metal/`; the images were staged at `c3f4e070f` (code as `14a707b1b`, which the host and guest checks ran at). Every text file passed through the orchestrator's `mask.sh`; a scan for the benches' vendor, product lines, model and BIOS strings counts 0. The raw log partitions are not published (binary, not maskable); their digests are below.

| machine | row | boot | runner | judge | verdict |
|---|---|---|---|---|---|
| T14 | `usbd_drives_the_type_c_controller` (jobs `test_rs_usbd_spare`, `test_rs_end_returns_claims`; `xhci-leave=8086:9a13`) | `testcases-xhci-leave`, image sha256 `c46d599bb8a53f15b1d75e90c68d005befc2f53c589b58b9e9f25d6623a92c6d` | boot rc=0 | exit 0, PASS | `t14/verdict.txt`: passed |
| AMD bench | `amdvi_translates_the_stick_controller` | `testcases`, image sha256 `74e7347a54179404191cf2de1b56a9cf206516da41bab43f9d993d801a2c3fbb` | boot rc=0 | exit 0, PASS | `amd/verdict.txt`: passed |

Raw `log-partition.img` sha256: T14 `bc123aa70d2ebc59b164cf708822081575ac52c4cdfa311dbd0be49c27e17baa`, AMD `d49c82c2fd26c46395858e084e78db5b2378608a435fe9630af783b0bfb3b847`.

Files, sha256 of what is published:

    1692577d5c5817b76d9c8d32a174011f33bd298c8d547c2d4d659a1077ea6500  amd/boot.txt
    57898b74cbaf4c2a52d5664d4da2ffd43a7a4ab9e991677c933230efdf8b32f8  amd/judge.log
    6c52790d648d2a9353885f120c6353d5726e4232e68356d4ce4b1cc704903689  amd/kernel.log
    526ce192e68ada9c0326f69540bb01dbd3c649dcb001274b9cebaf053d64fe3f  amd/loader.log
    58645bda498d837ffcfc93bf1be1a64c00c73b266ee966ec02b73e8495c0c249  amd/manifest.txt
    40e2ffa2d88c51442c8d3e99ec14a016da0ab47a9f84d95468157c2ef3cd4744  amd/runner.log
    1bdfddf84b3f270793744c909e474db77f4fff8b616d6c2643c0ca8e1ca85ebe  amd/system-038b1c1bade2e046.toml
    2700165975f68815c97d605c56eca8e90d497ade1264b6282401d13fee99ac27  amd/verdict.txt
    4795fc9574ee78655097ec29ad102464899c36bcb394c7e11d271e726057a6fa  t14/boot.txt
    df99808d2278be785ab04a48b3342840b281c9740b25491beead500381606932  t14/judge.log
    ad45d0521a320608a47ed484082e9f6e3685b0c13d5767fa2982854b6144d741  t14/kernel.log
    3bd6cb43edaa694795c9043de133486b2d9d9f219c035d5cf1df6dc0d70d08be  t14/loader.log
    584b494d5350d965a76ef23cb84c98259890e9b267cb500ad3419813f6ac5153  t14/manifest.txt
    9ea271033fee104c5ad9d97e3453ce664351de3d41329fd526c95a22e7affacd  t14/runner.log
    9a36140ae41f1e123a35a3be40cca952683548fa39a3dbbd53b359cef54968e5  t14/system-5de176b786b905b5.toml
    2700165975f68815c97d605c56eca8e90d497ade1264b6282401d13fee99ac27  t14/verdict.txt
