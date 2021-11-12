cbuffer constants : register(b0)
{
    row_major float4x4 transform;
    row_major float4x4 projection;
    float3 lightvector;
    float padding;
}

struct vs_in
{
    float3 position : POS;
    float3 normal : NOR;
    float2 texcoord : TEX;
    float4 color : COL;
};

struct vs_out
{
    float4 position : SV_POSITION;
    float2 texcoord : TEX;
    float4 color : COL;
};

Texture2D mytexture : register(t0);
SamplerState mysampler : register(s0);

float4 main(vs_out input) : SV_TARGET
{
    return mytexture.Sample(mysampler, input.texcoord) * input.color;
}